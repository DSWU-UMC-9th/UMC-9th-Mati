//
//  StateBindingView.swift
//  week2concept
//
//  Created by 김미주 on 9/24/25.
//

import SwiftUI

struct StateBindingView: View {
    @State private var count = 0
    @State private var text: String = ""
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack {
            Text("카운트: \(count)")
                .font(.largeTitle)
            
            Button("증가") {
                count += 1
            }
            .padding()
            
            Text("텍스트 내용: \(text)")
                .font(.largeTitle)
            
            TextField("아무 값을 입력해보세요!", text: $text)
                .frame(width: 350)
            
            Text("isClicked: \(isClicked)")
                .font(.largeTitle)
            
            CustomButton(isClicked: $isClicked)
                .padding()
        }
    }
}

#Preview {
    StateBindingView()
}
