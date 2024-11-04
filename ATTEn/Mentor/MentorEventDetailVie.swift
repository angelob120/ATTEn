//
//  MentorEventDetailVie.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//

import SwiftUI

struct MentorEventDetailView: View {
    let event: MentorEvent
    
    var body: some View {
        VStack(spacing: 20) {
            // Event Title
            Text(event.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            // Event Date and Day
            VStack(spacing: 8) {
                Text("Date: \(event.date)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text("Day: \(event.day)")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            // Additional Event Information
            VStack(alignment: .leading, spacing: 10) {
                Text("Location:")
                    .font(.headline)
                Text("Main Hall, Room 204")
                    .font(.body)
                    .foregroundColor(.primary)
                
                Text("Time:")
                    .font(.headline)
                Text("2:00 PM - 3:30 PM")
                    .font(.body)
                    .foregroundColor(.primary)
                
                Text("Description:")
                    .font(.headline)
                Text("Join us for an engaging mentor session where we’ll cover progress and goals for the upcoming month.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 8)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MentorEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MentorEventDetailView(event: MentorEvent(date: "SEP:3", day: "WENS", title: "Session 1", subtitle: "Mentor Session"))
    }
}
