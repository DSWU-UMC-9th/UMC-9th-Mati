//
//  TopView.swift
//  week2concept
//
//  Created by 김미주 on 9/28/25.
//

import SwiftUI

struct TopView: View {
    @StateObject var viewModel: TextViewModel = .init()
    @State private var showBottomView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("상위뷰")
                    .font(.largeTitle)
                Text("텍스트 입력 값: \(viewModel.inputText)")
                TextField("값 입력", text: $viewModel.inputText)
                    .frame(width: 350)
                
                Button("하위뷰 부르기") {
                    showBottomView.toggle()
                }
                .sheet(isPresented: $showBottomView) {
                    BottomView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    TopView()
}
