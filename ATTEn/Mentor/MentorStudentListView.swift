//
//  MentorStudentListView.swift
//  ATTEn
//
//  Created by AB on 11/14/24.
//

import SwiftUI

struct MentorStudentListView: View {
    // Sample data for students
    let students = Array(1...50).map { "Student \($0)" }
    
    var body: some View {
        VStack {
            Text("Students")
                .font(.headline)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            LazyVStack(alignment: .leading) {
                ForEach(students, id: \.self) { student in
                    NavigationLink(
                        destination: MentorStudentDetailView(
                            name: student,
                            email: "\(student.lowercased())@example.com", // Sample email
                            phone: "3136731685",                          // Sample phone
                            remainingTimeOffHours: 49.7,                  // Sample remaining time off hours
                            remainingClassDays: 12.4                      // Sample remaining class days
                        )
                    ) {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(student)
                                    .font(.headline)
                                    .foregroundColor(Color.primary)
                                
                                Text("Progress: 80%") // Assuming progress is displayed only here
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .navigationBarTitle("Students", displayMode: .inline)
    }
}

struct MentorStudentListView_Previews: PreviewProvider {
    static var previews: some View {
        MentorStudentListView()
    }
}
