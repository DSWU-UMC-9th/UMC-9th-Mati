//
//  TicketView.swift
//  week1practice
//
//  Created by 김미주 on 9/17/25.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.background)
                .resizable()
                .overlay {
                    Rectangle().foregroundStyle(.black.opacity(0.3))
                }
            
            VStack(spacing: 138) {
                TitleGroup
                
                ButtonGroup
            }
            .padding(.bottom, 17)
        }
        .frame(width: 386, height: 386)
    }
    
    private var TitleGroup: some View {
        VStack(spacing: 0) {
            Text("마이펫의 이중생활2")
                .font(.PretendardBold30)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            Text("본인 + 동반 1인")
                .font(.PretendardRegular16)
            Text("30,100원")
                .font(.PretendardBold24)
        }
        .foregroundStyle(.white)
        .frame(height: 84)
    }
    
    private var ButtonGroup: some View {
        Button(action: {
            print("예매하기")
        }) {
            VStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 18, height: 12)
                Text("예매하기")
                    .font(.PretendardSemiBold18)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    TicketView()
}
