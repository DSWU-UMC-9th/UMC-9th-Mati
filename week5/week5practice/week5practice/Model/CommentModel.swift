//
//  CommentModel.swift
//  week5practice
//
//  Created by 김미주 on 11/4/25.
//

import Foundation

struct CommentModel {
    let id: String
    let content: String
    let author: UserModel
    let createdAt: Date

    var isEditable: Bool {
        let fiveMinutesAgo = Date().addingTimeInterval(-300)
        return createdAt > fiveMinutesAgo
    }
}
