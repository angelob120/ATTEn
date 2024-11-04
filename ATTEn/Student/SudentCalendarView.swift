//
//  SudentCalendarView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
import SwiftUI

struct SimpleCalendarView: View {
    @State private var selectedDate: Date = Date()
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter
    private let monthYearFormatter: DateFormatter
    
    // Sample attendance data
    let attendanceStatus: [Int: String] = [
        1: "Attendance", 2: "Attendance", 3: "Attendance", 4: "Tardy", 7: "Absent", 8: "Tardy", 10: "Attendance", 6: "Attendance"
    ]
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        
        monthYearFormatter = DateFormatter()
        monthYearFormatter.dateFormat = "MMMM yyyy"
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Month and Year Title
                HStack {
                    Button(action: {
                        // Go to the previous month
                        selectedDate = calendar.date(byAdding: .month, value: -1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Text(monthYearFormatter.string(from: selectedDate))
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button(action: {
                        // Go to the next month
                        selectedDate = calendar.date(byAdding: .month, value: 1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                
                // Calendar Grid
                CalendarGridView(selectedDate: $selectedDate, attendanceStatus: attendanceStatus)
                    .padding(.horizontal, 8) // Adjust padding for better layout
                
                // Legend
                LegendView()
                    .padding(.top, 10)
                
                // Time off summary
                TimeOffSummaryView()
                
                // Action buttons
                ActionButtonView()
            }
            .padding()
            .background(Color(UIColor.systemBackground))
        }
    }
}

// Calendar grid showing each day of the month with attendance indicators
struct CalendarGridView: View {
    @Binding var selectedDate: Date
    let attendanceStatus: [Int: String]
    
    private let calendar = Calendar.current
    
    var body: some View {
        let daysInMonth = getDaysInMonth(for: selectedDate)
        let startOffset = getStartOffset(for: selectedDate)
        
        VStack {
            ForEach(0..<6) { row in
                HStack(spacing: 8) {
                    ForEach(0..<7) { col in
                        let day = row * 7 + col - startOffset + 1
                        if day > 0 && day <= daysInMonth {
                            DayCellView(day: day, isToday: isToday(day: day), status: attendanceStatus[day])
                                .onTapGesture {
                                    selectedDate = getDateForDay(day: day, in: selectedDate)
                                }
                        } else {
                            Spacer()
                                .frame(width: 40, height: 60)
                        }
                    }
                }
            }
        }
    }
    
    func getStartOffset(for date: Date) -> Int {
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        let weekday = calendar.component(.weekday, from: firstDayOfMonth)
        return weekday - 1
    }

    func getDaysInMonth(for date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)
        return range?.count ?? 30
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

// View for each day cell in the calendar grid with attendance indicators
struct DayCellView: View {
    let day: Int
    let isToday: Bool
    let status: String?
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(day)")
                .font(.headline)
                .padding(10)
                .background(isToday ? Color.accentColor : Color.clear)
                .foregroundColor(isToday ? .white : .primary)
                .clipShape(Circle())
            
            if let status = status {
                AttendanceStatusView(status: status)
            } else {
                Spacer()
                    .frame(height: 10)
            }
        }
        .frame(width: 40, height: 60)
    }
}

// View for attendance status indicators
struct AttendanceStatusView: View {
    let status: String
    
    var body: some View {
        switch status {
        case "Absent":
            Circle().fill(Color.red).frame(width: 8, height: 8)
        case "Tardy":
            Circle().fill(Color.yellow).frame(width: 8, height: 8)
        case "Attendance":
            Circle().fill(Color.green).frame(width: 8, height: 8)
        default:
            EmptyView()
        }
    }
}

// Legend view for attendance status indicators
struct LegendView: View {
    var body: some View {
        HStack(spacing: 16) {
            LegendItem(color: .red, label: "Absences")
            LegendItem(color: .yellow, label: "Tardies")
            LegendItem(color: .green, label: "Attendances")
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
    }
}

// Single legend item with color and label
struct LegendItem: View {
    let color: Color
    let label: String
    
    var body: some View {
        HStack {
            Circle().fill(color).frame(width: 16, height: 16)
            Text(label)
                .font(.caption)
                .foregroundColor(.primary)
        }
    }
}

// Time off summary view
struct TimeOffSummaryView: View {
    var body: some View {
        HStack {
            Text("Time Off Left: 50 Hours - 12 days")
                .font(.subheadline)
            Spacer()
            Text("(%90)")
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.green.opacity(0.2))
        .cornerRadius(8)
        .padding(.vertical)
    }
}

// Bottom action buttons for Fix Time, Request Time Off, and Detailed Attendance List
struct ActionButtonView: View {
    @State private var showFixTimeSheet = false
    @State private var showRequestTimeOffSheet = false
    @State private var showDetailedAttendanceListSheet = false
    
    var body: some View {
        VStack(spacing: 4) {
            Button(action: {
                showFixTimeSheet = true
            }) {
                HStack {
                    Text("Fix Time")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showFixTimeSheet) {
                StudentFixTimeSheetView()
            }
            
            Button(action: {
                showRequestTimeOffSheet = true
            }) {
                HStack {
                    Text("Request Time Off")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showRequestTimeOffSheet) {
                StudentRequestTimeOffSheetView()
            }
            
            Button(action: {
                showDetailedAttendanceListSheet = true
            }) {
                HStack {
                    Text("Detailed Attendance List")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showDetailedAttendanceListSheet) {
                StudentDetailedAttendanceListSheetView()
            }
        }
        .padding(.top, 8)
    }
}

struct SimpleCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCalendarView()
    }
}
