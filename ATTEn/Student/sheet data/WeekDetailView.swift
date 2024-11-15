//
//  WeekDetailView.swift
//  ATTEn
//
//  Created by AB on 11/11/24.
//

import SwiftUI

struct WeekDetailView: View {
    var weekNumber: Int
    @State private var selectedMonth = "NOVEMBER 2024"
    @State private var totalHours = "0 hours, 0 minutes"
    @State private var selectedDay = "Mon"
    
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text(selectedMonth)
                .font(.title2)
                .bold()
            
            Picker("", selection: $selectedDay) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day).tag(day)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            HStack {
                Text("Sum of hours")
                    .foregroundColor(.gray)
                Spacer()
                Text(totalHours)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            Text("ENTRY")
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("\(weekNumber)# Week")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WeekDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeekDetailView(weekNumber: 1)
    }
}
