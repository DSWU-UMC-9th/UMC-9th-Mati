//
//  UserDTO.swift
//  week5practice
//
//  Created by 김미주 on 11/1/25.
//

import Foundation

struct UserDTO: Codable {
    let userId: String
    let name: String
    let profileImage: String?
    let userBio: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name = "user_name"
        case profileImage = "profile_image"
        case userBio = "user_bio"
        case createdAt = "created_at"
    }
}

extension UserDTO {
    func toDomain() -> UserModel {
        return UserModel(
            id: userId,
            name: name,
            profileImageURL: profileImage,
            bio: userBio
        )
    }
}
