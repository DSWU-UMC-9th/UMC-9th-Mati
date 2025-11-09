//
//  UserModel.swift
//  week5practice
//
//  Created by 김미주 on 11/1/25.
//

import Foundation

struct UserModel {
    let id: String
    let name: String
    let profileImageURL: String?
    let bio: String

    var isProfileComplete: Bool {
        !name.isEmpty && !bio.isEmpty
    }

    var displayName: String {
        name.isEmpty ? "익명" : name
    }
}
