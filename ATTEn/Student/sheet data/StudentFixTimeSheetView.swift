//
//  FixTimeSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct StudentFixTimeSheetView: View {
    var body: some View {
        VStack {
            Text("Fix Time")
                .font(.largeTitle)
                .bold()
            Text("This is where the Fix Time functionality goes.")
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct StudentFixTimeSheetView_Previews: PreviewProvider {
    static var previews: some View {
        FixTimeSheetView()
    }
}
