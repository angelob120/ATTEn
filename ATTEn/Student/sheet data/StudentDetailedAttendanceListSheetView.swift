//
//  DetailedAttendanceListSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct StudentDetailedAttendanceListSheetView: View {
    @State private var selectedMonth = Date()
    @State private var totalHours = "14 hours, 5 minutes"
    
    let weeklyHours = [
        "3 hours, 27 minutes",
        "9 hours, 58 minutes",
        "0 hours, 39 minutes",
        "0 hours, 0 minutes",
        "0 hours, 0 minutes"
    ]
    
    private var monthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        changeMonth(by: -1)
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                    }
                    
                    Text(monthFormatter.string(from: selectedMonth))
                        .font(.title2)
                        .bold()
                    
                    Button(action: {
                        changeMonth(by: 1)
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }
                }
                
                HStack {
                    Text("Sum of hours")
                        .foregroundColor(.gray)
                    Spacer()
                    Text(totalHours)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                Text("HOUR BY WEEK")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                List(weeklyHours.indices, id: \.self) { index in
                    NavigationLink(destination: WeekDetailView(weekNumber: index + 1)) {
                        HStack {
                            Text("\(index + 1)")
                                .foregroundColor(.blue)
                            Text(weeklyHours[index])
                                .foregroundColor(.primary)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Detailed Attendance List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Today") {
                        selectedMonth = Date() // Reset to the current month
                    }
                }
            }
        }
    }
    
    private func changeMonth(by value: Int) {
        if let newDate = Calendar.current.date(byAdding: .month, value: value, to: selectedMonth) {
            selectedMonth = newDate
        }
    }
}

struct StudentDetailedAttendanceListSheetView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetailedAttendanceListSheetView()
    }
}
