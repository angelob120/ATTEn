//
//  MentorStudentDetailView.swift
//  ATTEn
//
//  Created by AB on 11/4/24.
//
import SwiftUI

struct MentorStudentDetailView: View {
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
                .padding()
            
            Text("Progress: \(progress)")
                .font(.title2)
                .padding(.bottom)
            
            Text("Additional information about \(name) goes here.")
                .padding()
            
            Spacer()
        }
        .navigationBarTitle("Student Details", displayMode: .inline)
    }
}

struct MentorStudentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MentorStudentDetailView(name: "Sample Student", progress: "80%")
        }
    }
}
