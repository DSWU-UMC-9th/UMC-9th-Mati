//
//  APIResponse.swift
//  week5practice
//
//  Created by 김미주 on 11/1/25.
//

import Foundation

struct APIResponse: Codable {
    let status: String
    let message: String
    let data: UserData
}

struct UserData: Codable {
    let users: [UserDTO]
}
