//
//  CalendarDay.swift
//  magabox
//
//  Created by 김미주 on 10/13/25.
//

import Foundation

struct CalendarDay: Identifiable {
    var id = UUID()
    let day: Int
    let date: Date
    let isCurrentMonth: Bool
}
