//
//  ReservationViewModel.swift
//  magabox
//
//  Created by 김미주 on 10/12/25.
//

import Foundation
import Combine

class ReservationViewModel: ObservableObject {
    // 영화 목록
    let movieModel: [MovieReservationModel] = [
        .init(poster: .init(.imgMovieNoOtherChoice), title: "어쩔수가없다", age: "15"),
        .init(poster: .init(.imgMovieDemonSlayer), title: "극장판 귀멸의 칼날: 무한성편", age: "15"),
        .init(poster: .init(.imgMovieF1), title: "F1 더 무비", age: "15"),
        .init(poster: .init(.imgMovieMononoke), title: "모노노케 히메", age: "ALL"),
        .init(poster: .init(.imgMovieBoss), title: "보스", age: "15"),
        .init(poster: .init(.imgMovieYadang), title: "야당: 익스텐디드 컷", age: "19"),
        .init(poster: .init(.imgMovieTheRoses), title: "더 로즈: 완벽한 이혼", age: "15")
    ]
    
    // 상영관 목록
    let theaterModel: [TheaterModel] = [
        .init(location: "강남", room: [
            .init(name: "르 리클라이너 5관", type: "2D", totalSeat: 116, times: [
                .init(startTime: "11:30", endTime: "13:58", emptySeat: 109),
                .init(startTime: "14:20", endTime: "16:48", emptySeat: 19),
                .init(startTime: "17:05", endTime: "19:28", emptySeat: 1),
                .init(startTime: "19:45", endTime: "22:02", emptySeat: 100),
                .init(startTime: "22:20", endTime: "00:04", emptySeat: 116)
            ])
        ]),
        .init(location: "홍대", room: [
            .init(name: "BTS관 (7층 1관 [Laser])", type: "2D", totalSeat: 160, times: [
                .init(startTime: "9:30", endTime: "11:50", emptySeat: 75),
                .init(startTime: "12:00", endTime: "14:25", emptySeat: 102),
                .init(startTime: "14:45", endTime: "17:04", emptySeat: 88)
            ]),
            .init(name: "BTS관 (9층 2관 [Laser])", type: "2D", totalSeat: 170, times: [
                .init(startTime: "11:30", endTime: "13:58", emptySeat: 34),
                .init(startTime: "14:10", endTime: "16:32", emptySeat: 100),
                .init(startTime: "16:50", endTime: "19:00", emptySeat: 13),
                .init(startTime: "19:20", endTime: "21:40", emptySeat: 92)
            ])
        ]),
//        .init(location: "신촌", room: [
//            .init(name: "컴포트 1관", type: "2D", totalSeat: 400, times: [
//                .init(startTime: "12:30", endTime: "14:30", emptySeat: 392),
//                .init(startTime: "18:00", endTime: "20:00", emptySeat: 392)
//            ]),
//            .init(name: "6관", type: "2D", totalSeat: 190, times: [
//                .init(startTime: "14:25", endTime: "16:15", emptySeat: 187),
//                .init(startTime: "16:30", endTime: "18:30", emptySeat: 189),
//                .init(startTime: "20:50", endTime: "22:50", emptySeat: 188)
//            ])
//        ])
    ]
    
    @Published var selectedMovie: MovieReservationModel? = nil // 선택된 영화
    @Published var selectedTheater: String? = nil // 선택된 영화관
    @Published var selectedDay: Date? = nil // 선택된 날짜
    
    @Published var canSelectTheater: Bool = false // 영화관 선택 가능 여부
    @Published var canSelectDay: Bool = false // 날짜 선택 가능 여부
    @Published var showRoom: Bool = false // 상영관 표시 여부
    
    private var c = Set<AnyCancellable>()
    
    init(initialMovie: MovieReservationModel? = nil) {
        self.selectedMovie = initialMovie
        
        $selectedMovie
            .map { $0 != nil }
            .assign(to: \.canSelectTheater, on: self)
            .store(in: &c)
        
        $selectedTheater
            .map { $0 != nil }
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
        guard let name = selectedTheater else {
            return []
        }
        return theaterModel.filter { $0.location == name }
    }
}
