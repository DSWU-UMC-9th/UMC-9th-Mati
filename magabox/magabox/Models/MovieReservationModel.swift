//
//  MovieReservationModel.swift
//  magabox
//
//  Created by 김미주 on 10/12/25.
//

import Foundation
import SwiftUI

struct MovieReservationModel: Identifiable {
    let id = UUID()
    let poster: Image
    let title: String
    let age: String
}
