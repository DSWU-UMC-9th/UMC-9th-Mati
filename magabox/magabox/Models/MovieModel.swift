//
//  MovieModel.swift
//  magabox
//
//  Created by 김미주 on 10/14/25.
//

import Foundation
import SwiftUI

struct MovieModel: Identifiable {
    let id = UUID()
    let poster: Image           // 영화 포스터
    let detailImage: Image      // 세부 이미지
    let titleKor: String        // 한글 제목
    let titleEng: String        // 영어 제목
    let count: String           // 누적 관객수
    let description: String     // 상세 정보
    let age: String             // 관람 등급
    let date: String            // 개봉일
    
    init(poster: Image = Image(""),
         detailImage: Image = Image(""),
         titleKor: String = "",
         titleEng: String = "",
         count: String = "",
         description: String = "",
         age: String = "",
         date: String = "") {
        self.poster = poster
        self.detailImage = detailImage
        self.titleKor = titleKor
        self.titleEng = titleEng
        self.count = count
        self.description = description
        self.age = age
        self.date = date
    }
}
