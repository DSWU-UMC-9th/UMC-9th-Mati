//
//  ReservationViewModel.swift
//  magabox
//
//  Created by 김미주 on 10/12/25.
//

import Combine
import Foundation

class ReservationViewModel: ObservableObject {
    // 원본 DTO 보관용
    private var movieDTOs: [MovieDTO] = []

    // 영화 목록
    @Published var movieModel: [MovieModel]
    @Published var isLoading: Bool = false
    
    @Published var selectedMovie: MovieModel? = nil // 선택된 영화
    @Published var selectedTheaters: Set<String> = [] // 선택된 영화관
    @Published var selectedDay: Date? = nil // 선택된 날짜
    
    @Published var canSelectTheater: Bool = false // 영화관 선택 가능 여부
    @Published var canSelectDay: Bool = false // 날짜 선택 가능 여부
    @Published var showRoom: Bool = false // 상영관 표시 여부
    
    private var c = Set<AnyCancellable>()
    
    init(movies: [MovieModel], initialMovie: MovieModel? = nil) {
        self.movieModel = movies
        self.selectedMovie = initialMovie
        
        $selectedMovie
            .map { $0 != nil }
            .assign(to: \.canSelectTheater, on: self)
            .store(in: &c)
        
        $selectedTheaters
            .map { !$0.isEmpty }
            .assign(to: \.canSelectDay, on: self)
            .store(in: &c)
        
        $selectedDay
            .map { $0 != nil }
            .assign(to: \.showRoom, on: self)
            .store(in: &c)
    }
    
    // 선택 날짜가 오늘인지 확인
    var isTodaySelected: Bool {
        guard let date = selectedDay else { return false }
        return Calendar.current.isDateInToday(date)
    }
    
    // 선택된 영화관 필터링
    var filteredTheaterModel: [TheaterModel] {
        guard
            let selectedMovie,
            let selectedDay,
            !selectedTheaters.isEmpty
        else {
            return []
        }
        
        guard let movieDTO = movieDTOs.first(where: { $0.title == selectedMovie.titleKor }) else {
            return []
        }
        
        let dateKey = dateString(from: selectedDay)
        
        guard let scheduleForDay = movieDTO.schedules.first(where: { $0.date == dateKey }) else {
            return []
        }
        
        let theatersForDay = scheduleForDay.toTheaterList()
        
        return theatersForDay.filter { selectedTheaters.contains($0.location) }
    }
    
    // MARK: - Functions
    
    private func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func toggleTheater(_ name: String) {
        if selectedTheaters.contains(name) {
            selectedTheaters.remove(name)
        } else {
            selectedTheaters.insert(name)
        }
    }

    func fetchMovies() async {
        isLoading = true
        
        guard let url = Bundle.main.url(
            forResource: "MovieSchedule", withExtension: "json"
        ),
            let data = try? Data(contentsOf: url) else { return }
        
        do {
            let response = try JSONDecoder().decode(APIResponse.self, from: data)
            
            await MainActor.run {
                self.movieDTOs = response.data.movies
                self.isLoading = false
            }
        } catch {
            print("Decoding error: ", error)
        }
    }
}
