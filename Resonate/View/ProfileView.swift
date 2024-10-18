//
//  ContentView.swift
//  Resonate
//
//  Created by Sebastian Presno on 09/10/24.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(\.modelContext) var context
    @State private var show: Bool = false
    @State private var username: String = ""
    
    // Filter users by username from UserDefaults
    @Query private var fetchedUsers: [UserSwiftData]
    
    init() {
        // Initialize the query with the username filter
        let savedUsername = UserDefaults.standard.string(forKey: "username") ?? ""
        _fetchedUsers = Query(filter: #Predicate<UserSwiftData> { $0.username == savedUsername })
        _username = State(initialValue: savedUsername)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let user = fetchedUsers.first {
                // Assuming ProfilePic can handle UserSwiftData type
                ProfilePic(user: user)
                    .padding(.top, 0)
                
                ArtistsCarousel(
                    title: "Artists",
                    show: $show,
                    artists: user.artists)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                
                Spacer()
            } else {
                Text("No user found for username \(username)")
                    .font(.headline)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $show) {
            ArtistGridView()
        }
    }
}


#Preview {
    ProfileView()
}
