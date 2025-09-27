//
//  MovieViewModel.swift
//  week2practice
//
//  Created by 김미주 on 9/28/25.
//

import Foundation
import SwiftUI

@Observable
class MovieViewModel {
    var currentIndex: Int = 0
    
    let movieModel: [MovieModel] = [
        .init(movieImage: .init(.mickey), movieName: "미키", movieLike: 972, movieReser: 30.8),
        .init(movieImage: .init(.toystory), movieName: "토이스토리", movieLike: 999, movieReser: 99.8),
        .init(movieImage: .init(.brutalis), movieName: "브루탈리스트", movieLike: 302, movieReser: 24.8),
        .init(movieImage: .init(.snowWhite), movieName: "백설공주", movieLike: 302, movieReser: 3.8),
        .init(movieImage: .init(.whiplash), movieName: "위플래시", movieLike: 604, movieReser: 62.2),
        .init(movieImage: .init(.conclave), movieName: "콘클라베", movieLike: 392, movieReser: 43.9),
        .init(movieImage: .init(.theFall), movieName: "더폴", movieLike: 30, movieReser: 2.1)
    ]
    
    // 이전
    func previous() {
        currentIndex = (currentIndex - 1 + movieModel.count) % movieModel.count
    }
    
    // 다음
    func next() {
        currentIndex = (currentIndex + 1) % movieModel.count
    }
}
