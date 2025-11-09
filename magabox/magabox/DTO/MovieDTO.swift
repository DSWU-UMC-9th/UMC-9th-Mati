//
//  MovieDTO.swift
//  magabox
//
//  Created by 김미주 on 11/4/25.
//

import Foundation
import SwiftUI

struct MovieDTO: Codable {
    let id: String
    let title: String
    let age_rating: String
    let schedules: [ScheduleDTO]
}

extension MovieDTO {
    func toDomain() -> MovieModel {
        return MovieModel(
            poster: Image(""),
            detailImage: Image(""),
            titleKor: title,
            titleEng: "",
            count: "",
            description: "",
            age: age_rating,
            date: ""
        )
    }
}
