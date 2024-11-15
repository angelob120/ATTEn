//
//  MentorMenteeDetailView.swift
//  ATTEn
//
//  Created by AB on 11/14/24.
//

import SwiftUI

struct MentorMenteeDetailView: View {
    let name: String
    let progress: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                .padding()
            
            Text("Progress: \(progress)")
                .font(.title2)
                .foregroundColor(.blue)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Mentee Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MentorMenteeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MentorMenteeDetailView(name: "Mentee 1", progress: "60%")
    }
}
