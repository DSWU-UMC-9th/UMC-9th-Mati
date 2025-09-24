//
//  LoginView.swift
//  magabox
//
//  Created by 김미주 on 9/17/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 60)
            TitleGroup
            Spacer()
            TextfieldGroup
            Spacer().frame(height: 75)
            ButtonGroup
            Spacer().frame(height: 35)
            SocialLoginGroup
            Spacer().frame(height: 39)
            UmcGroup
            Spacer().frame(height: 75)
        }
        .ignoresSafeArea()
        .padding(.horizontal, 16)
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
                print("로그인")
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: .infinity, height: 54)
                        .foregroundStyle(.purple03)
                    
                    Text("로그인")
                        .font(.bold18)
                        .foregroundStyle(.white)
                }
            }
            
            Button(action: {
                print("회원가입")
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
            .frame(width: .infinity)
            .aspectRatio(contentMode: .fit)

    }
    
    // 컴포넌트
    private func textfield(title: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.medium16)
                .foregroundStyle(.gray03)
            Divider()
                .background(.gray02)
        }
    }
}

#Preview {
    LoginView()
}
