//
//  PostModel.swift
//  week5practice
//
//  Created by 김미주 on 11/4/25.
//

import Foundation

struct PostModel {
    let id: String
    let content: String
    let author: UserModel
    let createdAt: Date
    let likes: Int

    var isRecent: Bool {
        let dayAgo = Date().addingTimeInterval(-86400)
        return createdAt > dayAgo
    }

    var formattedDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: createdAt, relativeTo: Date())
    }
}
