//
//  SplashView.swift
//  magabox
//
//  Created by 김미주 on 9/17/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.white
            
            Image(.imgMegabox)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
