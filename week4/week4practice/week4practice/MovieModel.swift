//
//  MovieModel.swift
//  week4practice
//
//  Created by 김미주 on 10/11/25.
//

import Foundation
import SwiftUI

struct MovieModel: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let rate: Double
}
