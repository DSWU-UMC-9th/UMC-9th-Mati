//
//  MovieSearchView.swift
//  magabox
//
//  Created by 김미주 on 10/14/25.
//

import SwiftUI

struct MovieSearchView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm: MovieSearchViewModel
    @ObservedObject var reservationVM: ReservationViewModel
    
    init(movies: [MovieModel], reservationVM: ReservationViewModel) {
        _vm = StateObject(wrappedValue: MovieSearchViewModel(movieModel: movies))
        self.reservationVM = reservationVM
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 36) {
                Text("영화 선택")
                    .font(.semiBold18)
                    .foregroundStyle(.black)
                
                // 영화 목록
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 60), count: 3), spacing: 36) {
                        ForEach(vm.displayMovies) { movie in
                            Button(action: {
                                reservationVM.selectedMovie = movie
                                dismiss()
                            }) {
                                VStack(spacing: 8) {
                                    movie.poster
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 95, height: 135)
                                    
                                    Text(movie.titleKor)
                                        .font(.semiBold14)
                                        .foregroundStyle(.black)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .padding(.horizontal,20)
                }
            }
            .searchable(text: $vm.query, prompt: "영화명을 입력해주세요")
        }
    }
}

#Preview {
//    MovieSearchView()
    HomeView()
}
