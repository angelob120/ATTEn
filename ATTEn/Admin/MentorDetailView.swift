//
//  MentorDetailView.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//

import SwiftUI

struct MentorDetailView: View {
    var name: String
    var progress: String
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.top, 20)
            
            Text(name)
                .font(.largeTitle)
                .padding(.top, 10)
            
            Text("Role: Mentor")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            Text("Progress: \(progress)")
                .font(.title2)
                .foregroundColor(.green)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Mentor Details")
        .navigationBarTitleDisplayMode(.inline)
    }
} 
