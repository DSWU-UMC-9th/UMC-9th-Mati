//
//  UserListView.swift
//  week3concept
//
//  Created by 김미주 on 10/3/25.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
}

struct UserListView: View {
    @State private var userViewModel: UserViewModel = .init()

    var body: some View {
        NavigationStack {
            List {
                ForEach(userViewModel.users.indices, id: \.self) { index in
                    NavigationLink(destination: UserEditView(user: $userViewModel.users[index])) {
                        HStack {
                            Text(userViewModel.users[index].name)
                            Spacer()
                            Text("\(userViewModel.users[index].age) years old")
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UserListView()
}
