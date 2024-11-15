//
//  AdminProfileView(.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//
import SwiftUI

struct AdminProfileView: View {
    
    // Sample Data for User Activity or Notifications
    let userActivities = [
        ("Aug 10, Monday", Array(repeating: "Reviewed project updates for team members.", count: 3)),
        ("Aug 9, Monday", Array(repeating: "Approved time-off requests for mentors.", count: 2)),
        ("Aug 7, Monday", Array(repeating: "Completed user profile audits.", count: 1)),
        ("Aug 3, Monday", Array(repeating: "Reviewed reports for compliance.", count: 1))
    ]
    
var body: some View {
        VStack {
            // Scrollable List of User Activity or Notifications
            ScrollView {
                ForEach(userActivities, id: \.0) { date, items in
                    VStack(alignment: .leading) {
                        // Date Header
                        Text(date)
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top, 5)
                        
                        ForEach(items, id: \.self) { item in
                            ActivityRow(activity: item)
                        }
                    }
                    .padding(.bottom, 10)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ActivityRow: View {
    let activity: String
    
    var body: some View {
        HStack(alignment: .top) {
            // Profile Image
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                // User Information
                Text("Angelo Brown")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                // Activity Description
                Text(activity)
                    .font(.subheadline)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct AdminProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AdminProfileView()
    }
}
