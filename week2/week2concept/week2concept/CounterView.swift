//
//  CounterView.swift
//  week2concept
//
//  Created by 김미주 on 9/26/25.
//

import SwiftUI

struct CounterView: View {
    var viewModel: CounterViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
            
            Button(action: {
                viewModel.count += 1
            }, label: {
                Text("카운트 증가 버튼")
            })
        }
    }
}

#Preview {
    CounterView()
}
