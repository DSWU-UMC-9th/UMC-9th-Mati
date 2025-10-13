//
//  ReservationView.swift
//  magabox
//
//  Created by 김미주 on 10/12/25.
//

import SwiftUI

enum Theater: String, CaseIterable {
    case 강남, 홍대, 신촌
}

struct ReservationView: View {
    private let movie: MovieModel
    
    @StateObject private var vm = ReservationViewModel()
    private var calendarVM = CalendarViewModel()
    
    init(movie: MovieModel) {
        self.movie = movie
    }
    
    // MARK: - View
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopSection
                
                MovieSelectSection
                
                TheaterSelectSection
                
                CalendarView(viewModel: calendarVM, reservationViewModel: vm)
                    .disabled(!vm.canSelectDay)
                
                Spacer().frame(height: 10)
                
                if vm.showRoom {
                    if !vm.isTodaySelected || vm.filteredTheaterModel.isEmpty {
                        Text("선택한 극장에 상영시간표가 없습니다.")
                            .font(.semiBold14)
                            .foregroundStyle(.gray03)
                    } else {
                        TimeSelectSection
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Section
    private var TopSection: some View {
        ZStack(alignment: .bottom) {
            Color.purple03
            
            Text("영화별 예매")
                .font(.bold22)
                .foregroundStyle(.white)
                .padding(20)
        }
        .frame(height: 125)
    }
    
    private var MovieSelectSection: some View {
        VStack(spacing: 20) {
            // 상단
            HStack(spacing: 8) {
                if let movie = vm.selectedMovie {
                    // 연령제한
                    Text(movie.age)
                        .font(.bold18)
                        .foregroundStyle(.white)
                        .frame(height: 24)
                        .padding(.horizontal, 3)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.orangeTag)
                        )
                    
                    // 제목
                    Text(movie.titleKor)
                        .font(.bold18)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                // 전체영화
                Button(action: {
                    print("전체영화")
                }) {
                    Text("전체영화")
                        .font(.semiBold14)
                        .foregroundStyle(.black)
                        .frame(width: 70, height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.clear)
                                .stroke(.gray02, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 16)
            
            // 영화 목록
            ScrollView(.horizontal) {
                LazyHStack(spacing: 8) {
                    ForEach(vm.movieModel, id: \.id) { movie in
                        Button(action: {
                            vm.selectedMovie = movie
                        }) {
                            movie.poster
                                .resizable()
                                .frame(width: 62, height: 89)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(movie.titleKor == vm.selectedMovie?.titleKor ? .purple03 : .clear, lineWidth: 2)
                                )
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private var TheaterSelectSection: some View {
        HStack {
            ForEach(Theater.allCases, id: \.self) { theater in
                let isSelected = vm.selectedTheater == theater.rawValue
                Button(action: {
                    vm.selectedTheater = theater.rawValue
                }) {
                    Text(theater.rawValue)
                        .font(.semiBold16)
                        .foregroundStyle(isSelected ? .white : .gray05)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(isSelected ? .purple03 : .gray01)
                        )
                }
                .disabled(!vm.canSelectTheater)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
    
    private var TimeSelectSection: some View {
        VStack(spacing: 29) {
            ForEach(vm.filteredTheaterModel) { theater in
                VStack(alignment: .leading, spacing: 20) {
                    // 지점 이름
                    Text(theater.location)
                        .font(.bold18)
                    
                    ForEach(theater.room) { room in
                        VStack(spacing: 20) {
                            // 상영관 정보
                            HStack {
                                Text(room.name)
                                    .font(.bold18)
                                Spacer()
                                Text(room.type)
                                    .font(.semiBold14)
                            }
                            
                            // 시간 선택
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 4), spacing: 20) {
                                ForEach(room.times) { time in
                                    Button(action: {
                                        print(time.startTime)
                                    }) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(.clear)
                                                .stroke(.gray02, lineWidth: 1)
                                            
                                            VStack(alignment: .leading, spacing: 8) {
                                                Text(time.startTime)
                                                    .font(.bold18)
                                                
                                                Text("~\(time.endTime)")
                                                    .font(.regular12)
                                                    .foregroundStyle(.gray03)
                                                
                                                HStack(spacing: 2) {
                                                    Text("\(time.emptySeat)")
                                                        .foregroundStyle(.purple03)
                                                    Text("/\(room.totalSeat)")
                                                        .foregroundStyle(.gray03)
                                                }
                                                .font(.semiBold14)
                                            }
                                            .padding(.vertical, 10)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundStyle(.black)
        .padding(.horizontal, 16)
        .padding(.bottom, 40)
    }
}

#Preview {
    ReservationView(movie: .init(poster: .init(.imgMovieNoOtherChoice), titleKor: "어쩔수가없다", count: "139만명"))
}
