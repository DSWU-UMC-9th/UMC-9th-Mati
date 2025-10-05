//
//  NavigationView.swift
//  week3concept
//
//  Created by 김미주 on 10/3/25.
//

import SwiftUI

struct NavigationView: View {
    let items = ["Apple", "Banana", "Cherry", "Mango"]
    
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(destination: DetailView(item: item)) {
                    Text(item)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

fileprivate struct DetailView: View {
    let item: String
    
    var body: some View {
        Text("Selected: \(item)")
            .navigationTitle("Hello Navigation")
    }
}

#Preview {
    NavigationView()
}
