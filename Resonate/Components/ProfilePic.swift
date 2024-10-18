//
//  ContentView.swift
//  Resonate
//
//  Created by Sebastian Presno on 08/10/24.
//

import SwiftUI

struct ProfilePic: View {
    var user: User // Accepting User object

    var body: some View {
        VStack {
            // Top section with the purple background
            ZStack {
                Color("aux1")
                    .frame(height: 150)

                // Profile image or placeholder
                if let picture = user.picture, let url = URL(string: picture) {
                    // Load image from URL
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .offset(y: 100)
                    } placeholder: {
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 120, height: 120)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                            )
                            .offset(y: 60)
                    }
                } else {
                    // Default placeholder image
                    Circle()
                        .fill(Color("terciary"))
                        .frame(width: 120, height: 120)
                        .overlay(
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                        )
                        .offset(y: 60)
                }
            }
            .edgesIgnoringSafeArea(.top)

            // Profile details (Name, Username, Description)
            VStack(spacing: 8) {
                Text("\(user.name) \(user.surname)") // Full name
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("terciary"))

                Text("@\(user.name.lowercased())") // Username (lowercased for simplicity)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(user.description) // User description
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 15)
            }
            .padding(.top, 50)  // Adjust spacing below profile picture
            .padding(.horizontal, 24)  // Adjust for wider screens
        }
    }
}

#Preview {
    ProfilePic(user: User(id: UUID(), name: "John", surname: "Doe", description: "Lorem ipsum dolor sit amet.", picture: nil, artists: [], genres: [], resonations: []))
}
