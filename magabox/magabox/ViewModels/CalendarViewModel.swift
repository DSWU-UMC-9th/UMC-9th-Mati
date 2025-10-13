//
//  CalendarViewModel.swift
//  magabox
//
//  Created by 김미주 on 10/13/25.
//

import Foundation

@Observable
class CalendarViewModel {
    var currentWeekStart: Date
    var selectedDate: Date?
    var calendar: Calendar
    
    init(currentWeekStart: Date = Date(), selectedDate: Date? = nil, calendar: Calendar = Calendar.current) {
        self.currentWeekStart = calendar.startOfDay(for: currentWeekStart)
        self.selectedDate = selectedDate
        self.calendar = calendar
    }
    
    // start 날짜부터 7일 배열
    func currentWeekDays() -> [CalendarDay] {
        var days: [CalendarDay] = []
        
        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: i, to: currentWeekStart) {
                let day = calendar.component(.day, from: date)
                
                let isCurrentMonth = calendar.isDate(date, equalTo: currentWeekStart, toGranularity: .month)
                
                days.append(CalendarDay(day: day, date: date, isCurrentMonth: isCurrentMonth))
            }
        }
        
        return days
    }
    
    // 날짜 선택
    func changeSelectedDate(_ date: Date) {
        if let currentSelectedDate = selectedDate, calendar.isDate(currentSelectedDate, inSameDayAs: calendar.startOfDay(for: date)) {
            return
        } else {
            selectedDate = calendar.startOfDay(for: date)
            print("날짜 변경: \(String(describing: selectedDate))")
        }
    }
}
