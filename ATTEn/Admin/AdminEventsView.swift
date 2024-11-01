//
//  AdminEventsView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct AdminEventsView: View {
    @State private var selectedDate: Date = Date() // The current selected date, default is today
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter
    private let monthYearFormatter: DateFormatter
    
    // Sample legend data for different types of attendance
    let attendanceStatus: [Int: String] = [
        1: "Attendance", 2: "Attendance", 3: "Attendance", 4: "Tardy", 5: "NoSchool", 7: "Absent", 8: "Attendance",
        9: "Tardy", 10: "Attendance", 12: "NoSchool", 13: "NoSchool", 20: "NoSchool"
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
            
            AdminCalendarGridView(selectedDate: $selectedDate, attendanceStatus: attendanceStatus)
            
            AdminLegendView()
            
            Spacer()
            
            AdminActionButtonView()
        }
        .padding()
    }
}

// Calendar grid showing days of the month
struct AdminCalendarGridView: View {
    @Binding var selectedDate: Date
    let attendanceStatus: [Int: String]
    
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
                            AdminDayCellView(day: day, isToday: isToday(day: day), status: attendanceStatus[day])
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
struct AdminDayCellView: View {
    let day: Int
    let isToday: Bool
    let status: String?
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(day)")
                .font(.headline)
                .padding(10)
                .background(isToday ? Color.green : Color.clear)
                .foregroundColor(isToday ? Color.white : Color.black)
                .clipShape(Circle())
            
            if let status = status {
                AdminAttendanceStatusView(status: status)
            } else {
                Spacer()
                    .frame(height: 10)
            }
        }
        .frame(width: 40, height: 60)
    }
}

// View for attendance status indicators (absent, tardy, attendance, etc.)
struct AdminAttendanceStatusView: View {
    let status: String
    
    var body: some View {
        switch status {
        case "Absent":
            Circle().fill(Color.red).frame(width: 8, height: 8)
        case "Tardy":
            Circle().fill(Color.yellow).frame(width: 8, height: 8)
        case "Attendance":
            Circle().fill(Color.green).frame(width: 8, height: 8)
        case "NoSchool":
            Image(systemName: "nosign")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.gray)
        default:
            EmptyView()
        }
    }
}

// Legend view for attendance status indicators
struct AdminLegendView: View {
    var body: some View {
        HStack(spacing: 16) {
            AdminLegendItem(color: .red, label: "Absences")
            AdminLegendItem(color: .yellow, label: "Tardies")
            AdminLegendItem(color: .green, label: "Attendances")
            AdminLegendItem(image: "nosign", label: "No School")
        }
        .padding()
    }
}

// Single legend item with color or image and label
struct AdminLegendItem: View {
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

// Bottom action buttons for Fix Time, Request Time Off, and Detailed Attendance List
struct AdminActionButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                // Action for fixing time
            }) {
                HStack {
                    Text("Fix Time")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.green.opacity(0.1))
            }
            
            Button(action: {
                // Action for requesting time off
            }) {
                HStack {
                    Text("Request Time Off")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.green.opacity(0.1))
            }
            
            Button(action: {
                // Action for detailed attendance list
            }) {
                HStack {
                    Text("Detailed Attendance List")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.green.opacity(0.1))
            }
        }
        .padding()
    }
}

struct AdminEventsView_Previews: PreviewProvider {
    static var previews: some View {
        AdminEventsView()
    }
}
