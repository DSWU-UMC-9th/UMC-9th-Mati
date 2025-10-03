//
//  HomeView.swift
//  magabox
//
//  Created by 김미주 on 10/3/25.
//

import SwiftUI

enum MovieTab {
    case chart
    case comingSoon
    
    var title: String {
        switch self {
        case .chart: return "무비차트"
        case .comingSoon: return "상영예정"
        }
    }
}

struct HomeView: View {
    @State private var selectedTab: MovieTab = .chart
    private var viewModel: HomeViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Header
                Spacer().frame(height: 9)
                MovieCardSection
                Spacer().frame(height: 37)
                MovieFeedSection
            }
        }
        .scrollIndicators(.hidden)
    }
    
    // MARK: - Section
    // 상단 헤더
    private var Header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(.imgMegaboxLogo)
            
            HStack {
                Text("홈")
                    .foregroundStyle(.black)
                Text("이벤트")
                Text("스토어")
                Text("선호극장")
            }
            .font(.semiBold24)
            .foregroundStyle(.gray04)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
    
    // 무비카드 섹션
    private var MovieCardSection: some View {
        VStack(spacing: 25) {
            // 버튼
            HStack(spacing: 23) {
                makeMovieCardButton(tab: .chart)
                makeMovieCardButton(tab: .comingSoon)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 18)
            
            // 영화
            ScrollView(.horizontal) {
                LazyHStack(spacing: 24) {
                    let movies = (selectedTab == .chart)
                        ? viewModel.movieModel
                        : viewModel.comingSoonModel
                    
                    ForEach(movies) { movie in
                        MovieCard(movie: movie)
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    // 알고보면 더 재밌는 무비피드 섹션
    private var MovieFeedSection: some View {
        VStack(spacing: 44) {
            // 상단
            VStack(spacing: 4) {
                HStack {
                    Text("알고보면 더 재밌는 무비피드")
                        .font(.bold24)
                        .foregroundStyle(.black)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "arrow.right")
                            .frame(width: 39, height: 39)
                            .foregroundStyle(.gray08)
                    }
                    .glassEffect()
                }
                
                Image(.imgMovieFeed)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            // 컨텐츠
            VStack(spacing: 39) {
                ForEach(viewModel.feedModel) { feed in
                    makeFeedContent(content: feed)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
    }
    
    // MARK: - Components
    private func makeMovieCardButton(tab: MovieTab) -> some View {
        let isSelected = (selectedTab == tab)
        
        return Button(action: {
            selectedTab = tab
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 19)
                    .fill(isSelected ? .gray08 : .gray02)
                    .frame(width: 84, height: 38)
                    
                Text(tab.title)
                    .font(.medium14)
                    .foregroundStyle(isSelected ? .white : .gray04)
            }
        }
        .glassEffect()
    }
    
    private func makeFeedContent(content: MovieFeedModel) -> some View {
        HStack(alignment: .top, spacing: 23) {
            content.image
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
            
            VStack(alignment: .leading, spacing: 25) {
                Text(content.title)
                    .font(.semiBold18)
                    .foregroundStyle(.black)
                    .lineLimit(2)
                
                Text(content.description)
                    .font(.semiBold13)
                    .foregroundStyle(.gray03)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HomeView()
}
