//
//  MentorProfileView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
import SwiftUI

struct MentorProfileView: View {
    // Sample data for students
    let students = Array(1...20).map { "Student \($0)" }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Profile Image Section
                    Image("profile_image") // Replace with your image asset
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.blue, lineWidth: 4)
                        )
                        .padding(.top, 20)
                    
                    // Name Section
                    Text("Angelo Brown")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    
                    // Mentor Information Section
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Mentor Information")
                            .font(.headline)
                            .padding(.top, 20)
                        
                        Text("Role: Mentor")
                        Text("Email: abrown23@msu.idserve.com")
                        Text("Phone: 000 - 000 - 0000")
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // List of Students
                    Text("Students")
                        .font(.headline)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(students, id: \.self) { student in
                            NavigationLink(destination: MentorStudentDetailView(name: student, progress: "80%")) {
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
                                        
                                        Text("Progress: 80%")
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
            }
            .navigationBarTitle("Mentor Profile", displayMode: .inline)
        }
    }
}

struct MentorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MentorProfileView()
    }
}
