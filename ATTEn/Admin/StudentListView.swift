//
//  StudentListView.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//
import SwiftUI

struct StudentListView: View {
    var body: some View {
        NavigationView {
            List(0..<20) { index in
                NavigationLink(destination: StudentDetailView(name: "Student \(index + 1)", progress: "80%")) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Student \(index + 1)")
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
            .listStyle(PlainListStyle())
            .navigationTitle("Students")
        }
    }
}
