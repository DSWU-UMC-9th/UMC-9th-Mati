//
//  PostDTO.swift
//  week5practice
//
//  Created by 김미주 on 11/4/25.
//

import Foundation

struct PostDTO: Codable {
    let post_id: String
    let content: String
    let author: UserDTO
    let created_timestamp: String
    let like_count: Int
}

enum PostMapper {
    static func toDomain(from dto: PostDTO) -> PostModel {
        // 날짜 변환
        let dateFormatter = ISO8601DateFormatter()
        let createdAt = dateFormatter.date(from: dto.created_timestamp) ?? Date()

        return PostModel(
            id: dto.post_id,
            content: dto.content,
            author: dto.author.toDomain(),
            createdAt: createdAt,
            likes: dto.like_count
        )
    }
}
