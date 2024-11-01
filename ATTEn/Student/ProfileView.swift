//
//  ProfileView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Profile Image Section
            Image("profile_image") // Replace with your image asset
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.green, lineWidth: 4)
                )
                .padding(.top, 20)
            
            // Name Section
            Text("Angelo Brown")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            // Info Section
            VStack(alignment: .leading, spacing: 5) {
                Text("Info")
                    .font(.headline)
                    .padding(.top, 20)
                
                Text("Mentor: Name")
                Text("Email: abrown23@msu.idserve.com")
                Text("Phone: 000 - 000 - 0000")
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Support Section
            VStack(alignment: .leading, spacing: 5) {
                Text("Support:")
                    .font(.headline)
                    .padding(.top, 20)
                
                Text("Academy Email: support@apple.com")
                Text("Ryver: @ryver-admin")
                Text("IT Support: IT@apple.com")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            // Action Buttons
            VStack(spacing: 0) {
                Button(action: {
                    // Action for requesting loaner device
                }) {
                    HStack {
                        Text("Request Loaner Device")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    // Action for One Login Dashboard
                }) {
                    HStack {
                        Text("One Login Dashboard")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .navigationBarTitle("Profile", displayMode: .inline)  // Optional navigation title
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}