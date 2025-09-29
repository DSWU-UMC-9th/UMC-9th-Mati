//
//  CustomButton.swift
//  week2concept
//
//  Created by 김미주 on 9/24/25.
//

import SwiftUI

struct CustomButton: View {
    @Binding var isClicked: Bool
    
    var body: some View {
        Button(action: {
            isClicked.toggle()
            print("하위 뷰: \(isClicked)")
        }, label: {
            Text("상위 뷰 값 변경")
        })
    }
}
