//
//  MentorDetailedAttendanceListSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct MentorDetailedAttendanceListSheetView: View {
    var body: some View {
        VStack {
            Text("Mentor Detailed Attendance List")
                .font(.largeTitle)
                .bold()
            Text("This is where the Mentor's Detailed Attendance List functionality goes.")
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct MentorDetailedAttendanceListSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MentorDetailedAttendanceListSheetView()
    }
}
