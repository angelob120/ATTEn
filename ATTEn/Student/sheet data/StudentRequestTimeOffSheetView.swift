//
//  RequestTimeOffSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct StudentRequestTimeOffSheetView: View {
    @State private var title: String = ""
    @State private var message: String = ""

    var body: some View {
        VStack {
            Spacer() // Push content to the center

            VStack(alignment: .center, spacing: 20) {
                // Title text
                Text("Request Time Off")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)

                // Title input field
                TextField("Enter title", text: $title)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                // Message input field styled with a placeholder
                ZStack(alignment: .topLeading) {
                    if message.isEmpty {
                        Text("Enter your message here")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                    }

                    TextEditor(text: $message)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                }
                .frame(height: 200) // Adjust height as needed
                .padding(.horizontal)

                // Blue Submit Button
                Button(action: {
                    // Add your submit action here
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()

            Spacer() // Push content to the center
        }
    }
}

struct StudentRequestTimeOffSheetView_Previews: PreviewProvider {
    static var previews: some View {
        StudentRequestTimeOffSheetView()
    }
}
