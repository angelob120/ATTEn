//
//  MentorListView.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//

import SwiftUI

struct MentorListView: View {
    var body: some View {
        NavigationView {
            List(0..<20) { index in
                NavigationLink(destination: MentorDetailView(name: "Mentor \(index + 1)", progress: "90%")) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Mentor \(index + 1)")
                                .font(.headline)
                                .foregroundColor(Color.primary)
                            
                            Text("Progress: 90%")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Mentors")
        }
    }
}
