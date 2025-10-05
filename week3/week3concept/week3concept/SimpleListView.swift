//
//  SimpleListView.swift
//  week3practice
//
//  Created by 김미주 on 10/3/25.
//

import SwiftUI

struct SimpleListView: View {
    var body: some View {
        List {
            Text("🍎 Apple")
            Text("🍌 Banana")
            Text("🍒 Cherry")
        }
    }
}

#Preview {
    SimpleListView()
}
