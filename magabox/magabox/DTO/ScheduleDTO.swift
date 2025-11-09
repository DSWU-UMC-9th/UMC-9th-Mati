//
//  ScheduleDTO.swift
//  magabox
//
//  Created by 김미주 on 11/4/25.
//

import Foundation

struct ScheduleDTO: Codable {
    let date: String
    let areas: [ScheduleAreaDTO]
}

extension ScheduleDTO {
    func toTheaterList() -> [TheaterModel] {
        areas.map { $0.toDomain() }
    }
}

struct ScheduleAreaDTO: Codable {
    let area: String
    let items: [ScheduleItemDTO]
}

extension ScheduleAreaDTO {
    func toDomain() -> TheaterModel {
        TheaterModel(
            location: area,
            room: items.map { $0.toDomain() }
        )
    }
}

struct ScheduleItemDTO: Codable {
    let auditorium: String
    let format: String
    let showtimes: [ScheduleShowtimeDTO]
}

extension ScheduleItemDTO {
    func toDomain() -> TheaterRoomModel {
        TheaterRoomModel(
            name: auditorium,
            type: format,
            totalSeat: showtimes.first?.total ?? 0,
            times: showtimes.map { $0.toDomain() }
        )
    }
}

struct ScheduleShowtimeDTO: Codable {
    let start: String
    let end: String
    let available: Int
    let total: Int
}

extension ScheduleShowtimeDTO {
    func toDomain() -> TheaterTimeModel {
        TheaterTimeModel(
            startTime: start,
            endTime: end,
            emptySeat: available
        )
    }
}
