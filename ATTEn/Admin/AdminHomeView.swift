//
//  AdminHomeView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct AdminHomeView: View {
    var body: some View {
        VStack {
            // Search Bar
            HStack {
                TextField("Search", text: .constant(""))
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            .padding()

            // List of Profiles
            List(0..<5) { _ in
                HStack {
                    // Circular Image
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    // Name and Completion Percentage
                    VStack(alignment: .leading) {
                        Text("Angelo Brown")
                            .font(.headline)
                        
                        Text("90%")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 10)
            }

            // Role-Specific Options
            HStack {
                Button(action: {
                    // Action for Student
                }) {
                    Text("Student")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Action for Mentor
                }) {
                    Text("Mentor")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                }
            }
            .padding()

            Spacer()
        }
    }
}

struct AdminHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdminHomeView()
    }
}
