//
//  MentorRequestTimeOffSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct MentorRequestTimeOffSheetView: View {
    var body: some View {
        VStack {
            Text("Mentor Request Time Off")
                .font(.largeTitle)
                .bold()
            Text("This is where the Mentor's Request Time Off functionality goes.")
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct MentorRequestTimeOffSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MentorRequestTimeOffSheetView()
    }
}
