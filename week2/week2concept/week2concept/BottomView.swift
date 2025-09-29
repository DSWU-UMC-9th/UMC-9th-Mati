//
//  BottomView.swift
//  week2concept
//
//  Created by 김미주 on 9/28/25.
//

import SwiftUI

struct BottomView: View {
    @ObservedObject var viewModel: TextViewModel
    
    init(viewModel: TextViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("하위 뷰")
                .font(.largeTitle)
            Text("현재 입력된 값: \(viewModel.inputText)")
            Button("강제 초기화") {
                viewModel.inputText = "초기화"
            }
            Spacer()
        }
    }
}
