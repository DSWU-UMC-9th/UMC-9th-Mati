//
//  MovieCard.swift
//  magabox
//
//  Created by 김미주 on 10/4/25.
//

import SwiftUI

struct MovieCard: View {
    let movie: MovieChartModel
    
    var body: some View {
        VStack(spacing: 8) {
            // 포스터
            movie.poster
                .resizable()
                .frame(width: 148, height: 212)
            
            // 버튼
            NavigationLink(destination: ReservationView(movie: movie)) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .stroke(.purple03)
                        .frame(width: 148, height: 36)
                        
                    Text("바로 예매")
                        .font(.medium16)
                        .foregroundStyle(.purple03)
                }
            }
            
            VStack(alignment: .leading, spacing: 3) {
                // 제목
                Text(movie.title)
                    .font(.bold22)
                    .foregroundStyle(.black)
                
                // 누적관객수
                Text("누적관객수 \(movie.count)")
                    .font(.medium18)
                    .foregroundStyle(.black)
            }
            .frame(width: 148, alignment: .leading)
        }
    }
}

#Preview {
    MovieCard(movie: .init(poster: .init(.imgMovieNoOtherChoice), title: "어쩔수가없다", count: "139만명"))
}
