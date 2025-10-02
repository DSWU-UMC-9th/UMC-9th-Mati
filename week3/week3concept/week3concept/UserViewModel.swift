//
//  UserViewModel.swift
//  week3concept
//
//  Created by 김미주 on 10/3/25.
//

import Foundation

@Observable
class UserViewModel {
    var users = [
        User(name: "Alice", age: 24),
        User(name: "Bob", age: 30),
        User(name: "Charlie", age: 28)
    ]
}
