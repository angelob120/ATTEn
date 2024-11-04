//
//  MentorEventsView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
import SwiftUI

struct MentorEventsView: View {
    var events = Array(repeating: MentorEvent(date: "SEP:3", day: "WENS", title: "Session 1:", subtitle: "Mentor Session"), count: 7)
    
    @State private var selectedEvent: MentorEvent? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Events:")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.leading, 16)
                .padding(.top, 20)
            
            // Header
            HStack {
                Text("Date")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("Event")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "arrow.up.arrow.down")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
            .padding(.horizontal, 16)
            
            // Event List
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(events.indices, id: \.self) { index in
                        MentorEventRow(event: events[index], isHighlighted: index == 0)
                            .onTapGesture {
                                selectedEvent = events[index]
                            }
                    }
                }
                .padding(.horizontal, 19)
                .padding(.top, 10)
            }
            
            Spacer()
        }
        .background(Color(UIColor.systemBackground)) // Adaptive background color
        .navigationBarTitle("Events", displayMode: .inline)
        .sheet(item: $selectedEvent) { event in
            MentorEventDetailView(event: event)
        }
    }
}

struct MentorEvent: Identifiable {
    var id = UUID()
    var date: String
    var day: String
    var title: String
    var subtitle: String
}

// Updated MentorEventRow without the ellipsis button
struct MentorEventRow: View {
    let event: MentorEvent
    let isHighlighted: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.date)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(event.day)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 10)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                    .fontWeight(isHighlighted ? .bold : .regular)
                    .foregroundColor(isHighlighted ? .white : .primary)
                
                Text(event.subtitle)
                    .font(.subheadline)
                    .foregroundColor(isHighlighted ? Color.white.opacity(0.8) : .secondary)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 50)
            .background(isHighlighted ? Color.blue : Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct MentorEventsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MentorEventsView()
                .preferredColorScheme(.light)
            MentorEventsView()
                .preferredColorScheme(.dark)
        }
    }
}
