//
//  RequestTimeOffSheetView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct StudentRequestTimeOffSheetView: View {
    var body: some View {
        VStack {
            Text("Request Time Off")
                .font(.largeTitle)
                .bold()
            Text("This is where the Request Time Off functionality goes.")
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct StudentRequestTimeOffSheetView_Previews: PreviewProvider {
    static var previews: some View {
        RequestTimeOffSheetView()
    }
}
