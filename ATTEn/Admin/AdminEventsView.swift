//
//  AdminEventsView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
import SwiftUI

struct AdminEventsView: View {
    @State private var selectedDate: Date = Date()
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter
    private let monthYearFormatter: DateFormatter
    
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
            HStack {
                Button(action: {
                    selectedDate = calendar.date(byAdding: .month, value: -1, to: selectedDate) ?? selectedDate
                }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }
                
                Text(monthYearFormatter.string(from: selectedDate))
                    .font(.title)
                    .bold()
                    .foregroundColor(.primary)
                
                Button(action: {
                    selectedDate = calendar.date(byAdding: .month, value: 1, to: selectedDate) ?? selectedDate
                }) {
                    Image(systemName: "chevron.right")
                        .padding()
                }
            }
            
            AdminCalendarGridView(selectedDate: $selectedDate, attendanceStatus: attendanceStatus)
            
            AdminLegendView()
            
            Spacer()
            
            AdminActionButtonView()
        }
        .padding()
        .background(Color(UIColor.systemBackground)) // Adapts background to light/dark mode
    }
}

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
                .foregroundColor(isToday ? .white : .primary)
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

struct AdminLegendView: View {
    var body: some View {
        HStack(spacing: 16) {
            AdminLegendItem(color: .red, label: "Absences")
            AdminLegendItem(color: .yellow, label: "Tardies")
            AdminLegendItem(color: .green, label: "Attendances")
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground)) // Adapts to light/dark mode
        .cornerRadius(8)
    }
}

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
                    .foregroundColor(.primary)
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.primary)
        }
    }
}

struct AdminActionButtonView: View {
    @State private var showCreateEvent = false
    @State private var showNotificationToStudents = false
    @State private var showNotificationToMentors = false

    var body: some View {
        VStack {
            Button(action: {
                showCreateEvent = true
            }) {
                HStack {
                    Text("Create Event")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showCreateEvent) {
                CreateEventView()
            }
            
            Button(action: {
                showNotificationToStudents = true
            }) {
                HStack {
                    Text("Send Out Notification to Students")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showNotificationToStudents) {
                NotificationToStudentsView()
            }
            
            Button(action: {
                showNotificationToMentors = true
            }) {
                HStack {
                    Text("Send Out Notification to Mentors")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showNotificationToMentors) {
                NotificationToMentorsView()
            }
        }
        .padding()
    }
}

struct AdminEventsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdminEventsView()
                .preferredColorScheme(.light)
            AdminEventsView()
                .preferredColorScheme(.dark)
        }
    }
}
