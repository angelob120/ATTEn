//
//  StudentEventsView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct StudentEventsView: View {
    var events = Array(repeating: Event(date: "SEP:3", day: "WENS", title: "Event 1:", subtitle: "Networking Event"), count: 7)
    
    @State private var selectedEvent: Event? = nil
    
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
                        EventRow(event: events[index], isHighlighted: index == 0) // Highlight the first event
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
            StudentEventDetailView(event: event)
        }
    }
}

struct Event: Identifiable {
    var id = UUID()
    var date: String
    var day: String
    var title: String
    var subtitle: String
}

struct EventRow: View {
    let event: Event
    let isHighlighted: Bool
    
    var body: some View {
        HStack {
            // Date and Day
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
            
            // Event Title and Subtitle
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
            .background(isHighlighted ? Color.green : Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
            
            Spacer()
            
            // Options Button
            Button(action: {
                // Action for more options
            }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(isHighlighted ? .white : .secondary)
            }
        }
        .padding(.vertical, 5)
    }
}

// Event Detail View for the Pop-up Sheet
struct StudentEventDetailView: View {
    let event: Event
    
    var body: some View {
        VStack {
            Text(event.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text(event.subtitle)
                .font(.title2)
                .foregroundColor(.secondary)
                .padding()
            
            Text("Date: \(event.date), Day: \(event.day)")
                .font(.body)
                .foregroundColor(.primary)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct StudentEventsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StudentEventsView()
                .preferredColorScheme(.light)
            StudentEventsView()
                .preferredColorScheme(.dark)
        }
    }
}
