//
//  MovieSearchViewModel.swift
//  magabox
//
//  Created by 김미주 on 10/14/25.
//

import Foundation
import Combine

class MovieSearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [MovieModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var c = Set<AnyCancellable>()
    
    private var movieModel: [MovieModel]
    
    init(movieModel: [MovieModel]) {
        self.movieModel = movieModel
        
        $query
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.errorMessage = nil
            })
            .flatMap { query in
                self.search(query: query)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let err) = completion {
                    self?.errorMessage = "검색 실패: \(err.localizedDescription)"
                    self?.results = []
                }
            } receiveValue: { [weak self] items in
                self?.results = items
            }
            .store(in: &c)
    }
    
    private func search(query: String) -> AnyPublisher<[MovieModel], Error> {
        return Future<[MovieModel], Error> { [weak self] promise in
            let delay = Double(Int.random(in: 300...700)) / 1000.0
            guard let self else { return }
            
            DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                let filtered = self.movieModel.filter { $0.titleKor.lowercased().contains(query) }
                promise(.success(filtered))
            }
        }
        .handleEvents(
            receiveSubscription: { _ in
                DispatchQueue.main.async {
                    self.isLoading = true
                }
            },
            receiveCompletion: { _ in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        )
        .eraseToAnyPublisher()
    }
    
    var displayMovies: [MovieModel] {
        if query.isEmpty {
            return movieModel
        } else {
            return results
        }
    }
}
