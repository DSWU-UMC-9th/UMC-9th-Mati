//
//  MovieSearchViewModel.swift
//  week4practice
//
//  Created by 김미주 on 10/11/25.
//

import Foundation
import SwiftUI
import Combine

final class MovieSearchViewModel: ObservableObject {
    @Published var query: String = "" // 검색
    @Published var results: [MovieModel] = [] // 결과
    @Published var isLoading: Bool = false // 로딩 처리
    @Published var errorMessage: String? // 에러 메시지
    
    private var bag = Set<AnyCancellable>() // 구독 유지
    
    private let model: [MovieModel] = [
        .init(image: .init(.mickey), title: "미키", rate: 9.1),
        .init(image: .init(.toyStory), title: "토이스토리", rate: 8.2),
        .init(image: .init(.brutalist), title: "브루탈리스트", rate: 8.2),
        .init(image: .init(.snowWhite), title: "백설공주", rate: 9.0),
        .init(image: .init(.whiplash), title: "위플래시", rate: 9.5),
        .init(image: .init(.conclave), title: "콘클라베", rate: 8.0),
        .init(image: .init(.theFall), title: "더폴", rate: 7.8),
    ]
    
    init() {
        $query
            .debounce(for: .milliseconds(350), scheduler: DispatchQueue.main) // 입력 멈춘 후 350ms 이후 동작
            .removeDuplicates() // 이전 값과 같으면 무시
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.errorMessage = nil
            })
            .flatMap { query in // 검색어 변경될 때마다 search()로 영화 조회
                self.search(query: query)
            }
            .receive(on: DispatchQueue.main) // UI 업데이트를 위해 메인 스레드에서 처리
            .sink { [weak self] completion in
                if case .failure(let err) = completion {
                    self?.errorMessage = "검색 실패: \(err.localizedDescription)"
                    self?.results = []
                }
            } receiveValue: { [weak self] items in
                self?.results = items
            }
            .store(in: &bag)
    }
    
    private func search(query: String) -> AnyPublisher<[MovieModel], Error> {
        return Future<[MovieModel], Error> { [weak self] promise in
            let delay = Double(Int.random(in: 300...700)) / 1000.0
            guard let self else { return }
            
            DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                let filtered = self.model.filter { $0.title.lowercased().contains(query) }
                promise(.success(filtered))
            }
        }
        .handleEvents( // 메인에서 로딩처리
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
}
