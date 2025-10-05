//
//  MovieDetailModel.swift
//  magabox
//
//  Created by 김미주 on 10/5/25.
//

import Foundation
import SwiftUI

struct MovieDetailModel: Identifiable {
    let id = UUID()
    let image: Image
    let titleKor: String
    let titleEng: String
    let description: String
    let age: String
    let date: String
}
