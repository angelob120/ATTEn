//
//  StudentDetailView.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//

import SwiftUI

struct StudentDetailView: View {
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
            
            Text("Role: Student")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            Text("Progress: \(progress)")
                .font(.title2)
                .foregroundColor(.blue)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Student Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
