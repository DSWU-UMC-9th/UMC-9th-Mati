//
//  LoginView.swift
//  magabox
//
//  Created by 김미주 on 9/17/25.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel = .init()
    @State private var isLoggedIn: Bool = false
    
    @AppStorage("id") private var id: String = ""
    @AppStorage("pwd") private var pwd: String = ""
    @AppStorage("username") private var username: String = "" // 회원 정보 섹션에서 사용 (임시)
 
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 20)
                TitleGroup
                Spacer()
                TextfieldGroup
                Spacer().frame(height: 75)
                ButtonGroup
                Spacer().frame(height: 35)
                SocialLoginGroup
                Spacer().frame(height: 39)
                UmcGroup
                Spacer().frame(height: 30)
            }
        }
        .ignoresSafeArea()
        .padding(.horizontal, 16)
        .fullScreenCover(isPresented: $isLoggedIn) {
            TabBar()
        }
    }
    
    // 하위뷰
    private var TitleGroup: some View {
        Text("로그인")
            .font(.semiBold24)
            .foregroundStyle(.black)
    }
    
    private var TextfieldGroup: some View {
        VStack(spacing: 40) {
            textfield(title: "아이디")
            textfield(title: "비밀번호")
        }
    }
    
    private var ButtonGroup: some View {
        VStack(spacing: 17) {
            Button(action: {
                if viewModel.userInfo.id == id && viewModel.userInfo.pwd == pwd {
                    isLoggedIn = true
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.purple03)
                    
                    Text("로그인")
                        .font(.bold18)
                        .foregroundStyle(.white)
                }
            }
            
            Button(action: {
                print("회원가입")
                id = viewModel.userInfo.id
                pwd = viewModel.userInfo.pwd
                username = "김미주"
            }) {
                Text("회원가입")
                    .font(.medium13)
                    .foregroundStyle(.gray04)
            }
        }
    }
    
    private var SocialLoginGroup: some View {
        HStack(spacing: 73) {
            Button(action: {
                print("네이버 로그인")
            }) {
                Image(.imgNaver)
            }
            
            Button(action: {
                print("카카오 로그인")
            }) {
                Image(.imgKakao)
            }
            
            Button(action: {
                print("애플 로그인")
            }) {
                Image(.imgApple)
            }
        }
    }
    
    private var UmcGroup: some View {
        Image(.imgUmc)
            .resizable()
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fit)

    }
    
    // 컴포넌트
    private func textfield(title: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            if title == "아이디" {
                TextField(title, text: $viewModel.userInfo.id)
                    .font(.medium16)
                    .foregroundStyle(.black)
                    .textInputAutocapitalization(.never)
            } else if title == "비밀번호" {
                SecureField(title, text: $viewModel.userInfo.pwd)
                    .font(.medium16)
                    .foregroundStyle(.black)
                    .textInputAutocapitalization(.never)
            }
            Divider()
                .background(.gray02)
        }
    }
}

#Preview {
    LoginView()
}
