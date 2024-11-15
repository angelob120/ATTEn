//
//  StudentListView.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//

import SwiftUI

struct StudentListView: View {
    var body: some View {
        NavigationView {
            List(0..<20) { index in
                // Breaking up the expressions into simpler sub-expressions
                let studentName = "Student \(index + 1)"
                let email = "student\(index + 1)@example.com"
                let phone = "123-456-789\(index % 10)"
                
                // Explicitly define these as Double values
                let remainingTimeOffHours: Double = Double(50 - index)
                let remainingClassDays: Double = 10.0 - Double(index) * 0.5
                
                NavigationLink(
                    destination: MentorStudentDetailView(
                        name: studentName,
                        email: email,
                        phone: phone,
                        remainingTimeOffHours: remainingTimeOffHours,
                        remainingClassDays: remainingClassDays
                    )
                ) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(studentName)
                                .font(.headline)
                                .foregroundColor(Color.primary)
                            
                            Text("Progress: 80%")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Students")
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
    }
}
