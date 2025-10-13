//
//  MovieDetailView.swift
//  magabox
//
//  Created by 김미주 on 10/4/25.
//

import SwiftUI

enum MovieDetailTab: CaseIterable {
    case info
    case review
    
    var title: String {
        switch self {
        case .info: return "상세 정보"
        case .review: return "실관람평"
        }
    }
}

struct MovieDetailView: View {
    @State private var selectedTab: MovieDetailTab = .info
    @Namespace private var tabNamespace
    
    let movie: MovieModel
    let viewModel: MovieDetailViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 9) {
                if let matchedMovie = viewModel.detailModel.first(where: { $0.titleKor == movie.titleKor }) {
                    matchedMovie.detailImage
                        .resizable()
                        .scaledToFit()
                    
                    // 타이틀
                    VStack(spacing: 0) {
                        Text(matchedMovie.titleKor)
                            .font(.bold24)
                            .foregroundStyle(.black)
                        Text(matchedMovie.titleEng)
                            .font(.semiBold14)
                            .foregroundStyle(.gray03)
                    }
                    
                    // 설명
                    Text(matchedMovie.description)
                        .font(.semiBold18)
                        .foregroundStyle(.gray03)
                        .padding(.horizontal, 16)
                    
                    Spacer().frame(height: 26)
                    
                    // 세그먼트
                    HStack(spacing: 0) {
                        ForEach(MovieDetailTab.allCases, id: \.self) { tab in
                            Button(action: {
                                selectedTab = tab
                            }) {
                                VStack {
                                    Text(tab.title)
                                        .font(.bold22)
                                        .foregroundStyle(selectedTab == tab ? .black : .gray02)
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.clear)
                                            .frame(height: 2)
                                        
                                        if selectedTab == tab {
                                            Rectangle()
                                                .fill(Color.black)
                                                .frame(height: 2)
                                                .matchedGeometryEffect(id: "Tab", in: tabNamespace)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .background(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.gray02)
                            .frame(height: 2)
                    }
                    
                    Spacer().frame(height: 8)
                    
                    Group {
                        if selectedTab == .info {
                            HStack(alignment: .top, spacing: 12) {
                                movie.poster
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                
                                VStack(alignment: .leading, spacing: 9) {
                                    Text(matchedMovie.age)
                                    Text("\(matchedMovie.date) 개봉")
                                }
                                .font(.semiBold13)
                                .foregroundStyle(.black)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        } else if selectedTab == .review {
                            Text("등록된 관람평이 없어요 🥲")
                                .font(.semiBold18)
                                .foregroundStyle(.gray08)
                                .padding(.vertical, 60)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.purple02, lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationTitle(movie.titleKor)
    }
}

#Preview {
    MovieDetailView(movie: .init(poster: .init(.imgMovieF1), titleKor: "F1 더 무비", count: "515만명"))
}
