//
//  UserInfoView.swift
//  magabox
//
//  Created by 김미주 on 9/28/25.
//

import SwiftUI

struct UserInfoView: View {
    @AppStorage("username") private var username: String = ""
    
    var body: some View {
        VStack(spacing: 33) {
            VStack(spacing: 15) {
                ProfileHeader
                
                MembershipButton
            }
            
            StatusInfo
            
            ReservationGroup
            
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal, 16)
    }
    
    // MARK: - Views
    private var ProfileHeader: some View {
        VStack {
            HStack(spacing: 5) {
                Text("\(hideText(text: username))님")
                    .font(.bold24)
                    .foregroundStyle(.black)
                
                Text("WELCOME")
                    .font(.medium14)
                    .foregroundStyle(.white)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.tag)
                    )
                
                Spacer()
                
                Button(action: {}) {
                    Text("회원정보")
                        .font(.semiBold14)
                        .foregroundStyle(.white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 11.5)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.gray07)
                        )
                }
            }
            
            Spacer()
            
            HStack(spacing: 9) {
                Text("멤버십 포인트")
                    .font(.semiBold14)
                    .foregroundStyle(.gray04)
                
                Text("500P")
                    .font(.medium14)
                    .foregroundStyle(.black)
                
                Spacer()
            }
        }
        .frame(height: 56)
    }
    
    private var MembershipButton: some View {
        Button(action: {}) {
            ZStack {
                HStack(spacing: 9) {
                    Text("클럽 멤버십")
                        .font(.semiBold16)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 5, height: 10)
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(LinearGradient(colors: [Color(red: 0.67, green: 0.55, blue: 1), Color(red: 0.36, green: 0.8, blue: 0.93)], startPoint: .leading, endPoint: .trailing))
                )
            }
        }
    }
    
    private var StatusInfo: some View {
        HStack(spacing: 43) {
            makeStatus(title: "쿠폰", count: 2)
            
            Divider()
                .background(.gray02)
                .frame(height: 31)
            
            makeStatus(title: "스토어 교환권", count: 0)
            
            Divider()
                .background(.gray02)
                .frame(height: 31)
            
            makeStatus(title: "모바일 티켓", count: 0)
        }
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .stroke(.gray02, lineWidth: 1)
        )
    }
    
    private var ReservationGroup: some View {
        HStack {
            makeReserView(image: Image(.imgInfoMovie), title: "영화별예매")
            Spacer()
            makeReserView(image: Image(.imgInfoLocation), title: "극장별예매")
            Spacer()
            makeReserView(image: Image(.imgInfoChair), title: "특별관예매")
            Spacer()
            makeReserView(image: Image(.imgInfoPopcorn), title: "모바일오더")
        }
    }
    
    // MARK: - functions
    private func hideText(text: String) -> String {
        var chars = Array(text)
        
        if text.count < 1 { return text }
        else {
            for i in 1..<text.count-1 {
                chars[i] = "*"
            }
        }
        
        return String(chars)
    }
    
    private func makeStatus(title: String, count: Int) -> some View {
        VStack(spacing: 9) {
            Text(title)
                .font(.semiBold16)
                .foregroundStyle(.gray02)
            
            Text(String(count))
                .font(.semiBold18)
                .foregroundStyle(.black)
        }
    }
    
    private func makeReserView(image: Image, title: String) -> some View {
        VStack(spacing: 12) {
            image
            
            Text(title)
                .font(.medium16)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    UserInfoView()
}
