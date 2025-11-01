//
//  CalendarView.swift
//  magabox
//
//  Created by 김미주 on 10/13/25.
//

import SwiftUI

// 셀
struct CalendarCell: View {
    var day: CalendarDay
    var isSelected: Bool
    @Bindable var viewModel: CalendarViewModel
    @ObservedObject var reservationViewModel: ReservationViewModel
    
    var body: some View {
        Button(action: {
            viewModel.changeSelectedDate(day.date)
            reservationViewModel.selectedDay = day.date
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? .purple03 : .clear)
                
                VStack(spacing: 5) {
                    Text("\(day.day)")
                        .font(.bold18)
                        .foregroundStyle(dayColor)
                    
                    Text(dayOfWeek)
                        .font(.semiBold14)
                        .foregroundStyle(isSelected ? .white : .gray03)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 12)
            }
        }
    }
    
    // 요일
    private var dayOfWeek: String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(day.date) {
            return "오늘"
        } else if calendar.isDateInTomorrow(day.date) {
            return "내일"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            return dateFormatter.string(from: day.date)
        }
    }
    
    // 날짜 색상
    private var dayColor: Color {
        let week = Calendar.current.component(.weekday, from: day.date)
        
        if isSelected {
            return .white
        }
        
        switch week {
        case 1:
            return .red
        case 7:
            return .tag
        default:
            return .black
        }
    }
}

// 주간 달력
struct CalendarView: View {
    @Bindable var viewModel: CalendarViewModel
    @ObservedObject var reservationViewModel: ReservationViewModel
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 5) {
            ForEach(viewModel.currentWeekDays(), id: \.id) { day in
                
                let isSelectedDate = viewModel.selectedDate != nil ?
                    viewModel.calendar.isDate(day.date, inSameDayAs: viewModel.selectedDate!) :
                    false
                CalendarCell(day: day, isSelected: isSelectedDate, viewModel: viewModel, reservationViewModel: reservationViewModel)
            }
        }
        .padding(.horizontal, 16)
    }
}

//#Preview {
//    CalendarView()
//}
