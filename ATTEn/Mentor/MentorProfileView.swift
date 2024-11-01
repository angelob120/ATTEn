//
//  MentorProfileView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct MentorProfileView: View {
    var body: some View {
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
            
            // Support Section
            VStack(alignment: .leading, spacing: 5) {
                Text("Support Contacts:")
                    .font(.headline)
                    .padding(.top, 20)
                
                Text("Academy Support: support@academy.com")
                Text("Mentor Support: mentor@support.com")
                Text("IT Support: it@support.com")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            // Action Buttons
            VStack(spacing: 10) {
                Button(action: {
                    // Action for scheduling a session
                }) {
                    HStack {
                        Text("Schedule a Session")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Button(action: {
                    // Action for viewing mentor dashboard
                }) {
                    HStack {
                        Text("View Mentor Dashboard")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .navigationBarTitle("Mentor Profile", displayMode: .inline)
    }
}

struct MentorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MentorProfileView()
    }
}
