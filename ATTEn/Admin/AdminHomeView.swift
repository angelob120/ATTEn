//
//  AdminHomeView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
import SwiftUI

struct AdminHomeView: View {
    @State private var showStudentList = true
    
    var body: some View {
        VStack {
            // Search Bar
            HStack {
                TextField("Search", text: .constant(""))
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .foregroundColor(Color.primary)
            }
            .padding()
            
            // Conditional list based on selection
            if showStudentList {
                StudentListView()
            } else {
                MentorListView()
            }
            
            // Role-Specific Options
            HStack {
                Button(action: {
                    showStudentList = true
                }) {
                    Text("Student")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(showStudentList ? Color.blue : Color(.systemGray5))
                        .cornerRadius(10)
                        .foregroundColor(showStudentList ? .white : Color.primary)
                }
                
                Button(action: {
                    showStudentList = false
                }) {
                    Text("Mentor")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(!showStudentList ? Color.blue : Color(.systemGray5))
                        .cornerRadius(10)
                        .foregroundColor(!showStudentList ? .white : Color.primary)
                }
            }
            .padding()
            
            Spacer()
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct AdminHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdminHomeView()
            .preferredColorScheme(.light) // Toggle to .dark for dark mode
    }
}
