//
//  FixTimeSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
///Users/ab/Downloads/Code Projects/ATTEn/ATTEn

import SwiftUI

struct FixTimeSheetView: View {
    var body: some View {
        VStack {
            Spacer() // Push content to the center

            VStack {
                Text("Student Calendar")
                    .font(.largeTitle)
                    .padding()

                // Navigation to StudentFixTimeSheetView
                NavigationLink(destination: StudentFixTimeSheetView()) {
                    Text("Go to Fix Time Sheet")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            Spacer() // Push content to the center
        }
        .navigationTitle("Student Calendar")
    }
}

struct StudentFixTimeSheetView: View {
    @State private var title: String = ""
    @State private var bodyText: String = ""

    var body: some View {
        VStack {
            Spacer() // Push content to the center

            VStack(alignment: .leading, spacing: 20) {
                Text("Student Fix Time Sheet")
                    .font(.largeTitle)
                    .padding()

                // Title input field
                TextField("Enter title", text: $title)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                // Body input field styled like the title input field
                ZStack(alignment: .topLeading) {
                    if bodyText.isEmpty {
                        Text("Enter body text here")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                    }

                    TextEditor(text: $bodyText)
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

                // Save button
                Button(action: {
                    // Add action to handle form submission
                    print("Title: \(title), Body: \(bodyText)")
                }) {
                    Text("Save")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
            }

            Spacer() // Push content to the center
        }
        .navigationTitle("Fix Time Sheet")
    }
}

struct FixTimeSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FixTimeSheetView()
        }
    }
}
