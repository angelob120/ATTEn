//
//  ContentView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            EventsView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Events")
                }
        }
        .accentColor(.blue) // Customize the color as needed
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
