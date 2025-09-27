//
//  TextViewModel.swift
//  week2concept
//
//  Created by 김미주 on 9/28/25.
//

import Foundation
import SwiftUI

class TextViewModel: ObservableObject {
    @Published var inputText: String = ""
    
    init() {
        print("새로운 TextViewModel 인스턴스 생성")
    }
}
