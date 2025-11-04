//
//  CommentDTO.swift
//  week5practice
//
//  Created by 김미주 on 11/4/25.
//

import Foundation

struct CommentDTO: Codable {
    let comment_id: String
    let text: String
    let user: UserDTO
    let timestamp: String
}

enum CommentMapper {
    static func toDomain(from dto: CommentDTO) -> CommentModel {
        let dateFormatter = ISO8601DateFormatter()
        let createdAt = dateFormatter.date(from: dto.timestamp) ?? Date()

        return CommentModel(
            id: dto.comment_id,
            content: dto.text,
            author: dto.user.toDomain(),
            createdAt: createdAt
        )
    }
}
