//
//  TheaterModel.swift
//  magabox
//
//  Created by 김미주 on 10/14/25.
//

import Foundation

// 영화관
struct TheaterModel: Identifiable {
    let id = UUID()
    let location: String
    let room: [TheaterRoomModel]
}

// 상영관
struct TheaterRoomModel: Identifiable {
    let id = UUID()
    let name: String
    let type: String // 2D
    let totalSeat: Int
    let times: [TheaterTimeModel]
}

struct TheaterTimeModel: Identifiable {
    let id = UUID()
    let startTime: String
    let endTime: String
    let emptySeat: Int
}
