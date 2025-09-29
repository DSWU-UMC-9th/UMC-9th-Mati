//
//  UserManageView.swift
//  magabox
//
//  Created by 김미주 on 9/28/25.
//

import SwiftUI

struct UserManageView: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("id") private var id: String = ""
    @AppStorage("username") private var username: String = ""
    
    @State private var newName: String = ""
    
    var body: some View {
        VStack(spacing: 53) {
            Header
            
            VStack(spacing: 26) {
                Title
                
                TextFieldGroup
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .task {
            newName = username
        }
    }
    
    // MARK: - Views
    private var Header: some View {
        ZStack {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(.iconBack)
                }
                Spacer()
            }
            
            Text("회원정보 관리")
                .font(.medium16)
                .foregroundStyle(.black)
        }
    }
    
    private var Title: some View {
        Text("기본 정보")
            .font(.bold18)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var TextFieldGroup: some View {
        VStack(spacing: 24) {
            // 아이디
            VStack(alignment: .leading, spacing: 3) {
                Text(id)
                    .font(.medium18)
                    .foregroundStyle(.black)
                Divider()
                    .background(.gray02)
                    .frame(height: 1)
            }
            
            // 이름
            VStack(alignment: .leading, spacing: 3) {
                VStack(spacing: 3) {
                    HStack {
                        TextField("이름", text: $newName)
                            .font(.medium18)
                            .foregroundStyle(.black)
                        Spacer()
                        Button(action:{
                            print("이름 변경")
                            username = newName
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray03, lineWidth: 1)
                                    .frame(width: 38, height: 20)
                                Text("변경")
                                    .font(.medium10)
                                    .foregroundStyle(.gray03)
                            }
                        }
                    }
                    Divider()
                        .background(.gray02)
                        .frame(height: 1)
                }
            }
        }
    }
}

#Preview {
    UserManageView()
}
