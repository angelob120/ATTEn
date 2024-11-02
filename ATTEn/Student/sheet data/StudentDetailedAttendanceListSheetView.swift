//
//  DetailedAttendanceListSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct DetailedAttendanceListSheetView: View {
    var body: some View {
        VStack {
            Text("Detailed Attendance List")
                .font(.largeTitle)
                .bold()
            Text("This is where the Detailed Attendance List functionality goes.")
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct DetailedAttendanceListSheetView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedAttendanceListSheetView()
    }
}