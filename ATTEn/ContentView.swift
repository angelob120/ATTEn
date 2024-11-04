//
//  ContentView.swift
//  ATTEn
//
//  Created by AB on 11/1/24.
//

import SwiftUI

enum UserRole {
    case student
    case mentor
    case admin
}

struct ContentView: View {
    @State private var selectedRole: UserRole = .student  // Default role

    var body: some View {
        VStack {
            // Role-specific TabView
            roleBasedTabView()
        }
        .accentColor(.blue)
    }
    
    // Role-based TabView setup
    @ViewBuilder
    private func roleBasedTabView() -> some View {
        TabView {
            switch selectedRole {
            case .student:
                StudentTabView()
            case .mentor:
                MentorTabView()
            case .admin:
                AdminTabView()
            }
            
            // Switch Role View for all roles to change roles
            SwitchRoleView(selectedRole: $selectedRole)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Switch Role")
                }
        }
    }
}

struct SwitchRoleView: View {
    @Binding var selectedRole: UserRole
    
    var body: some View {
        VStack {
            Text("Switch Role")
                .font(.largeTitle)
                .padding()
            
            Button("Switch to Student") {
                selectedRole = .student
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button("Switch to Mentor") {
                selectedRole = .mentor
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button("Switch to Admin") {
                selectedRole = .admin
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
    }
}

// Student Tab View
struct StudentTabView: View {
    var body: some View {
        Group {
            StudentHomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            SimpleCalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            
            StudentProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            StudentEventsView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Events")
                }
        }
    }
}

// Mentor Tab View
struct MentorTabView: View {
    var body: some View {
        Group {
            MentorHomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Dashboard")
                }
            
            MentorCalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
            
            MentorProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            MentorEventsView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Tasks")
                }
        }
    }
}

// Admin Tab View
struct AdminTabView: View {
    var body: some View {
        Group {
            AdminHomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Dashboard")
                }
            
            AdminProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Users")
                }
            
            AdminEventsView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Reports")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
