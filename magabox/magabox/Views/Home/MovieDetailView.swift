//
//  MovieDetailView.swift
//  magabox
//
//  Created by 김미주 on 10/4/25.
//

import SwiftUI

enum MovieDetailTab {
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
    @State private var segmentSize: CGSize = .zero   // 세그먼트 실제 크기
    @State private var contentSize: CGSize = .zero   // 전체 컨텐츠 크기(선택)
    
    let movie: MovieChartModel
    let viewModel: MovieDetailViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 9) {
                if let matchedMovie = viewModel.detailModel.first(where: { $0.titleKor == movie.title }) {
                    matchedMovie.image
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
                        makeSegmentButton(tab: .info)
                        makeSegmentButton(tab: .review)
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
                }
            }
        }
        .navigationTitle(movie.title)
    }
    
    // MARK: - Components
    private func makeSegmentButton(tab: MovieDetailTab) -> some View {
        let isSelected = (selectedTab == tab)
        
        return Button(action: {
            selectedTab = tab
        }) {
            VStack {
                Text(tab.title)
                    .font(.bold22)
                    .foregroundStyle(isSelected ? .black : .gray02)
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(isSelected ? .black : .gray02)
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: .init(poster: .init(.imgMovieF1), title: "F1 더 무비", count: "515만명"))
}
