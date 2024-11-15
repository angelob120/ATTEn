//
//  MentorStudentDetailView.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//

import SwiftUI

struct MentorStudentDetailView: View {
    var name: String
    var email: String
    var phone: String
    var remainingTimeOffHours: Double
    var remainingClassDays: Double
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Image
                Image("profile_placeholder") // Replace with an actual image name or use a URL
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 20)
                
                // Name and Icons
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                HStack(spacing: 30) {
                    Button(action: {
                        // Add camera action here
                    }) {
                        Image(systemName: "camera.fill")
                            .font(.title)
                    }
                    
                    Button(action: {
                        // Add emoji action here
                    }) {
                        Image(systemName: "face.smiling.fill")
                            .font(.title)
                    }
                }
                
                Divider()
                
                // Remaining Time Off Section
                VStack(spacing: 5) {
                    Text("Remaining Time Off:")
                        .font(.headline)
                    
                    Text("\(remainingTimeOffHours, specifier: "%.1f") Hours (\(remainingClassDays, specifier: "%.1f") Class Days)")
                        .font(.title2)
                }
                .padding(.bottom, 20)
                
                Divider()
                
                // Role
                HStack {
                    Text("Mentor")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("None")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                Divider()
                
                // Contact Information
                VStack(alignment: .leading, spacing: 8) {
                    Text("CONTACT")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("Email")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(email)
                            .foregroundColor(.primary)
                    }
                    
                    HStack {
                        Text("Phone")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(phone)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // Report Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("REPORT")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: StudentCalendarView()) {
                        Text("Attendance Calendar")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 5)
                    }
                    
                    NavigationLink(destination: StudentDetailedAttendanceListSheetView()) {
                        Text("Detailed Attendance List")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 5)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Student Details", displayMode: .inline)
    }
}

struct MentorStudentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MentorStudentDetailView(
                name: "Angelo Brown",
                email: "angelobrown1000@gmail.com",
                phone: "3136731685",
                remainingTimeOffHours: 49.7,
                remainingClassDays: 12.4
            )
        }
    }
}
