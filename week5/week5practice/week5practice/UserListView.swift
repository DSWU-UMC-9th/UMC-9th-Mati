//
//  UserListView.swift
//  week5practice
//
//  Created by 김미주 on 11/4/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var vm = UserListViewModel()
    @State private var showAddUser = false

    var body: some View {
        NavigationStack {
            ZStack {
                if vm.isLoading {
                    ProgressView("로딩중...")
                } else {
                    List {
                        ForEach(vm.users, id: \.id) { user in
                            UserRowView(user: user)
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                vm.deleteUser(id: vm.users[index].id)
                            }
                        }
                    }
                }
            }
            .navigationTitle("사용자 목록")
            .toolbar {
                Button {
                    showAddUser = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .task {
                await vm.fetchUsers()
            }
        }
    }
}

struct UserRowView: View {
    let user: UserModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.displayName)
                .font(.headline)

            Text(user.bio)
                .font(.subheadline)
                .foregroundStyle(.gray)

            if user.isProfileComplete {
                Label("프로필 완성", systemImage: "checkmark.circle.fill")
                    .font(.caption)
                    .foregroundStyle(.green)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    UserListView()
}
