//
//  APIResponse.swift
//  magabox
//
//  Created by 김미주 on 11/4/25.
//

import Foundation

struct APIResponse: Codable {
    let status: String
    let message: String
    let data: MovieData
}

struct MovieData: Codable {
    let movies: [MovieDTO]
}
