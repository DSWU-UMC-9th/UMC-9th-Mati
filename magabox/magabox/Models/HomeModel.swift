//
//  HomeModel.swift
//  magabox
//
//  Created by 김미주 on 10/4/25.
//

import Foundation
import SwiftUI

struct MovieChartModel: Identifiable {
    let id = UUID()
    let poster: Image
    let title: String
    let count: String
}

struct MovieFeedModel: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let description: String
}
