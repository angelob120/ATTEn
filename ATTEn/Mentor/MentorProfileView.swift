//
//  MentorProfileView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
import SwiftUI

struct MentorProfileView: View {
    @State private var showingStudents = true // State variable to toggle views
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        // Toggle between Students and Mentees views
                        if showingStudents {
                            MentorStudentListView()
                        } else {
                            MentorMenteeListView()
                        }
                    }
                }
                
                // Buttons to switch between Students and Mentees
                HStack {
                    Button(action: {
                        showingStudents = true
                    }) {
                        Text("Students")
                            .fontWeight(showingStudents ? .bold : .regular)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(showingStudents ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        showingStudents = false
                    }) {
                        Text("Mentees")
                            .fontWeight(!showingStudents ? .bold : .regular)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(!showingStudents ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
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
