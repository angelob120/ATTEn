//
//  MentorCalendarView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
//
//  MentorMessageCenterView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct MentorMessageCenterView: View {
    
    // Sample Data for Mentor Messages
    let mentorMessages = [
        ("Aug 10, Monday", Array(repeating: "Please review the project updates for this week.", count: 3)),
        ("Aug 9, Monday", Array(repeating: "Time-off request has been approved.", count: 2)),
        ("Aug 7, Monday", Array(repeating: "Your profile audit is complete.", count: 1)),
        ("Aug 3, Monday", Array(repeating: "New report available for review.", count: 1))
    ]
    
    var body: some View {
        VStack {
            // Scrollable List of Mentor Messages
            ScrollView {
                ForEach(mentorMessages, id: \.0) { date, messages in
                    VStack(alignment: .leading) {
                        // Date Header
                        Text(date)
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top, 5)
                        
                        ForEach(messages, id: \.self) { message in
                            MentorMessageRow(message: message)
                        }
                    }
                    .padding(.bottom, 10)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct MentorMessageRow: View {
    let message: String
    
    var body: some View {
        HStack(alignment: .top) {
            // Profile Image
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                // User Information
                Text("Angelo Brown")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                // Message Content
                Text(message)
                    .font(.subheadline)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct MentorMessageCenterView_Previews: PreviewProvider {
    static var previews: some View {
        MentorMessageCenterView()
    }
}
