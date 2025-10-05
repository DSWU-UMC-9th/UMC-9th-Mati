//
//  ForEachRangeView.swift
//  week3practice
//
//  Created by 김미주 on 10/3/25.
//

import SwiftUI

struct ForEachRangeView: View {
    var body: some View {
        VStack {
            ForEach(1..<6) { index in
                Text("항목 \(index)")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    ForEachRangeView()
}
