//
//  MentorCalendarView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct MentorCalendarView: View {
    @State private var selectedDate: Date = Date() // The current selected date, default is today
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter
    private let monthYearFormatter: DateFormatter
    
    // Sample legend data for different types of statuses
    let mentorStatus: [Int: String] = [
        1: "Session", 2: "Session", 3: "Session", 4: "Late", 5: "Unavailable", 7: "Absent", 8: "Session",
        9: "Late", 10: "Session", 12: "Unavailable", 13: "Unavailable", 20: "Unavailable"
    ]
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        
        monthYearFormatter = DateFormatter()
        monthYearFormatter.dateFormat = "MMMM yyyy"
    }
    
    var body: some View {
        VStack(spacing: 1) {
            Text(monthYearFormatter.string(from: selectedDate))
                .font(.title)
                .bold()
            
            MentorCalendarGridView(selectedDate: $selectedDate, statusData: mentorStatus)
            
            MentorLegendView()
            
            Spacer()
            
            MentorActionButtonView()
        }
        .padding()
    }
}

// Calendar grid showing days of the month
struct MentorCalendarGridView: View {
    @Binding var selectedDate: Date
    let statusData: [Int: String]
    
    private let calendar = Calendar.current
    
    var body: some View {
        let daysInMonth = getDaysInMonth(for: selectedDate)
        let startOfMonth = getStartOfMonth(for: selectedDate)
        
        VStack {
            ForEach(0..<6) { row in
                HStack(spacing: 8) {
                    ForEach(0..<7) { col in
                        let day = getDayFor(row: row, column: col, daysInMonth: daysInMonth, startOfMonth: startOfMonth)
                        if day > 0 && day <= daysInMonth {
                            MentorDayCellView(day: day, isToday: isToday(day: day), status: statusData[day])
                                .onTapGesture {
                                    selectedDate = getDateForDay(day: day, in: selectedDate)
                                }
                        } else {
                            Spacer()
                                .frame(width: 40, height: 40)
                        }
                    }
                }
            }
        }
    }
    
    func getStartOfMonth(for date: Date) -> Int {
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        return calendar.component(.weekday, from: firstDayOfMonth) - 1
    }

    func getDaysInMonth(for date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)
        return range?.count ?? 30
    }

    func getDayFor(row: Int, column: Int, daysInMonth: Int, startOfMonth: Int) -> Int {
        return row * 7 + column - startOfMonth + 1
    }

    func getDateForDay(day: Int, in monthDate: Date) -> Date {
        var components = calendar.dateComponents([.year, .month], from: monthDate)
        components.day = day
        return calendar.date(from: components) ?? Date()
    }

    func isToday(day: Int) -> Bool {
        let today = calendar.component(.day, from: Date())
        return today == day && calendar.isDate(Date(), equalTo: selectedDate, toGranularity: .month)
    }
}

// View for each day cell in the calendar grid
struct MentorDayCellView: View {
    let day: Int
    let isToday: Bool
    let status: String?
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(day)")
                .font(.headline)
                .padding(10)
                .background(isToday ? Color.blue : Color.clear)
                .foregroundColor(isToday ? Color.white : Color.black)
                .clipShape(Circle())
            
            if let status = status {
                MentorStatusView(status: status)
            } else {
                Spacer()
                    .frame(height: 10)
            }
        }
        .frame(width: 40, height: 60)
    }
}

// View for mentor status indicators (session, late, unavailable, etc.)
struct MentorStatusView: View {
    let status: String
    
    var body: some View {
        switch status {
        case "Absent":
            Circle().fill(Color.red).frame(width: 8, height: 8)
        case "Late":
            Circle().fill(Color.yellow).frame(width: 8, height: 8)
        case "Session":
            Circle().fill(Color.blue).frame(width: 8, height: 8)
        case "Unavailable":
            Image(systemName: "nosign")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.gray)
        default:
            EmptyView()
        }
    }
}

// Legend view for mentor status indicators
struct MentorLegendView: View {
    var body: some View {
        HStack(spacing: 16) {
            MentorLegendItem(color: .red, label: "Absent")
            MentorLegendItem(color: .yellow, label: "Late")
            MentorLegendItem(color: .blue, label: "Session")
            MentorLegendItem(image: "nosign", label: "Unavailable")
        }
        .padding()
    }
}

// Single legend item with color or image and label
struct MentorLegendItem: View {
    let color: Color?
    let image: String?
    let label: String
    
    init(color: Color, label: String) {
        self.color = color
        self.image = nil
        self.label = label
    }
    
    init(image: String, label: String) {
        self.color = nil
        self.image = image
        self.label = label
    }
    
    var body: some View {
        HStack {
            if let color = color {
                Circle().fill(color).frame(width: 16, height: 16)
            }
            if let image = image {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            Text(label)
                .font(.caption)
        }
    }
}

// Bottom action buttons for mentor-specific options
struct MentorActionButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                // Action for checking in
            }) {
                HStack {
                    Text("Check In")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
            }
            
            Button(action: {
                // Action for reporting availability
            }) {
                HStack {
                    Text("Report Availability")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
            }
            
            Button(action: {
                // Action for viewing sessions
            }) {
                HStack {
                    Text("View Sessions")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
            }
        }
        .padding()
    }
}

struct MentorCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MentorCalendarView()
    }
}
