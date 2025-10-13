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
    
    // 홈 화면 Init
    init(poster: Image, titleKor: String, count: String) {
        self.poster = poster
        self.titleKor = titleKor
        self.count = count
        
        self.detailImage = Image("")
        self.titleEng = ""
        self.description = ""
        self.age = ""
        self.date = ""
    }
    
    // 상세 정보 Init
    init(image: Image, titleKor: String, titleEng: String, description: String, age: String, date: String) {
        self.detailImage = image
        self.titleKor = titleKor
        self.titleEng = titleEng
        self.description = description
        self.age = age
        self.date = date
        
        self.poster = Image("")
        self.count = ""
    }
    
    // 예매 Init
    init(poster: Image, titleKor: String, age: String) {
        self.poster = poster
        self.titleKor = titleKor
        self.age = age
        
        self.detailImage = Image("")
        self.titleEng = ""
        self.count = ""
        self.description = ""
        self.date = ""
    }
}
