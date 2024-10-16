//
//  ContentView.swift
//  Resonate
//
//  Created by Sebastian Presno on 09/10/24.
//

import SwiftUI

struct ProfileView: View {
    @State var show: Bool = false
    // Sample user data
    var user = User(
        id: UUID(),
        name: "Sebastian",
        surname: "Presno",
        description: "Swift developer and music enthusiast.",
        picture: nil, // You can use a URL string here for a profile picture
        artists: [],
        genres: [],
        resonations: []
    )
    
    var body: some View {
        VStack(spacing: 0) {
            ProfilePic(user: user)
                .padding(.top, 0)

            ArtistsCarousel(title: "Artists", show: $show)
                .padding(.horizontal, 20)
                .padding(.top, 40)

            Spacer()
        }
        .edgesIgnoringSafeArea(.top)        .sheet(isPresented: $show) {
            ArtistGridView()
        }
    }
}

#Preview {
    ProfileView()
}
