//
//  TabBar.swift
//  magabox
//
//  Created by 김미주 on 10/3/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house.fill") {
                
            }
            
            Tab("바로 예매", systemImage: "play.tv") {
                
            }
            
            Tab("모바일 오더", systemImage: "popcorn") {
                
            }
            
            Tab("마이 페이지", systemImage: "person") {
                UserInfoView()
            }
        }
        .tint(.black)
    }
}

#Preview {
    TabBar()
}
