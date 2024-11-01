//
//  Home.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct StudentHomeView: View {
    @State private var selectedDate: Date = Date()  // State to track the selected date
    @State private var isPunchedIn: Bool = false  // State for punch in/out
    @State private var timeElapsed: String = "00:00:00"  // Placeholder for the timer
    @State private var weekOffset: Int = 0  // Offset for swiping between weeks
    @State private var dragOffset: CGFloat = 0  // For tracking the drag gesture
    @State private var timer: Timer?  // Timer instance
    @State private var secondsElapsed: Int = 0  // Counter for total elapsed seconds
    
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter
    private let dayOfWeekFormatter: DateFormatter
    private let monthFormatter: DateFormatter  // Formatter for the month name

    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"  // Day number
        
        dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "EEE"  // Day of the week
        
        monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM yyyy"  // Month and year
    }
    
    var body: some View {
        VStack {
            // Week Calendar View
            VStack {
                HStack {
                    Text(monthFormatter.string(from: firstDayOfTheWeek(weekOffset: weekOffset)))
                        .font(.title2)
                        .bold()
                        .padding(.leading, 16)
                    Spacer()
                }
                
                Divider()
                
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        WeekView(dates: weekDays(weekOffset: weekOffset),
                                 selectedDate: $selectedDate,
                                 dateFormatter: dateFormatter,
                                 dayOfWeekFormatter: dayOfWeekFormatter)
                            .frame(width: geometry.size.width)
                        
                        WeekView(dates: weekDays(weekOffset: weekOffset + (dragOffset < 0 ? 1 : -1)),
                                 selectedDate: $selectedDate,
                                 dateFormatter: dateFormatter,
                                 dayOfWeekFormatter: dayOfWeekFormatter)
                            .frame(width: geometry.size.width)
                    }
                    .offset(x: dragOffset)
                    .gesture(DragGesture()
                        .onChanged { value in
                            dragOffset = value.translation.width
                        }
                        .onEnded { value in
                            let threshold = geometry.size.width / 2
                            if value.translation.width < -threshold {
                                withAnimation(.easeInOut) {
                                    weekOffset += 1
                                    dragOffset = 0
                                }
                            } else if value.translation.width > threshold {
                                withAnimation(.easeInOut) {
                                    weekOffset -= 1
                                    dragOffset = 0
                                }
                            } else {
                                withAnimation(.easeInOut) {
                                    dragOffset = 0
                                }
                            }
                        }
                    )
                }
                .frame(height: 100)
            }
            .padding(.top, 16)
            
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.leading, 16)
                
                Text("Good Morning Angelo!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding(.vertical, 16)
            
            VStack {
                ZStack {
                    Circle()
                        .trim(from: 0, to: isPunchedIn ? 1 : 0)
                        .stroke(isPunchedIn ? Color.green : Color.gray, lineWidth: 12)
                        .frame(width: 250, height: 250)
                        .rotationEffect(.degrees(-90))
                        .animation(.linear(duration: 1), value: isPunchedIn)
                    
                    Text(timeElapsed)
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.primary)
                }
                .padding()
                
                Button(action: togglePunch) {
                    Text(isPunchedIn ? "Punch Out" : "Punch In")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(isPunchedIn ? Color.red : Color.green)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 24)
            
            Spacer()
        }
        .background(Color(UIColor.systemBackground)) // Adaptive background color
    }
    
    // Timer toggle function
    func togglePunch() {
        if isPunchedIn {
            stopTimer()
        } else {
            startTimer()
        }
        isPunchedIn.toggle()
    }
    
    // Start the timer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsElapsed += 1
            let hours = secondsElapsed / 3600
            let minutes = (secondsElapsed % 3600) / 60
            let seconds = secondsElapsed % 60
            timeElapsed = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
    
    // Stop the timer
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        secondsElapsed = 0
        timeElapsed = "00:00:00"
    }
    
    // Helper functions
    func firstDayOfTheWeek(weekOffset: Int) -> Date {
        let today = Date()
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
        return calendar.date(byAdding: .day, value: weekOffset * 7, to: startOfWeek)!
    }

    func weekDays(weekOffset: Int) -> [Date] {
        let startOfWeek = firstDayOfTheWeek(weekOffset: weekOffset)
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}

struct WeekView: View {
    let dates: [Date]
    @Binding var selectedDate: Date
    let dateFormatter: DateFormatter
    let dayOfWeekFormatter: DateFormatter
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(dates, id: \.self) { date in
                VStack {
                    Text(dayOfWeekFormatter.string(from: date))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(dateFormatter.string(from: date))
                        .font(.headline)
                        .padding(10)
                        .background(isSameDay(date1: selectedDate, date2: date) ? Color.green : Color.clear)
                        .foregroundColor(isSameDay(date1: selectedDate, date2: date) ? .white : (isSameDay(date1: Date(), date2: date) ? Color.green : .primary))
                        .clipShape(Circle())
                }
                .onTapGesture {
                    selectedDate = date
                }
            }
        }
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}

struct StudentHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StudentHomeView()
                .preferredColorScheme(.light)  // Light mode preview
            StudentHomeView()
                .preferredColorScheme(.dark)  // Dark mode preview
        }
    }
}
