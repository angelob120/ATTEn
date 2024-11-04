//
//  MentorFixTimeSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct MentorFixTimeSheetView: View {
    var body: some View {
        VStack {
            Text("Mentor Fix Time")
                .font(.largeTitle)
                .bold()
            Text("This is where the Mentor's Fix Time functionality goes.")
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct MentorFixTimeSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MentorFixTimeSheetView()
    }
}
