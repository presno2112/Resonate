//
//  ArtistsView.swift
//  Resonate
//
//  Created by Sebastian Presno on 14/10/24.
//

import SwiftUI
import SwiftData

struct ArtistGridView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \ArtistSwiftData.name) var dataArtists: [ArtistSwiftData]
    @State private var fetchedUser: UserSwiftData? = nil
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible()), GridItem(.flexible()),
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField("Find your favorite artist", text: .constant(""))
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color("aux2"))
                .cornerRadius(10)
                .padding()

                // Grid of artist bubbles
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(dataArtists) { artist in
                            VStack {
                                Button(action: {
                                    print("Tapped \(artist.name)")
                                    addArtistToUser(artist: artist) // Function to add artist
                                    dismiss()
                                }) {
                                    if let imageName = artist.image {
                                        Image(imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                    } else {
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                    }
                                }

                                Text(artist.name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Artists")
        }
        .onAppear {
            fetchFirstUser() // Fetch user when the view appears
        }
    }

    // MARK: - Functions

    // Add the artist to the user's artist list
    private func addArtistToUser(artist: ArtistSwiftData) {
        guard let user = fetchedUser else {
            print("No user found")
            return
        }

        if !user.artists.contains(where: { $0.id == artist.id }) {
            // Append the artist to the user's artist list
            user.artists.append(artist)
            
            // Save the updated user data to the context
            do {
                try context.save()
                print("Artist \(artist.name) added to user's collection")
            } catch {
                print("Failed to save updated user: \(error)")
            }
        } else {
            print("Artist \(artist.name) already in user's collection")
        }
    }

    // Fetch the first user from the model
    private func fetchFirstUser() {
        let fetchRequest = UserSwiftData.fetchRequest()
        do {
            let users = try context.fetch(fetchRequest)
            fetchedUser = users.first // Assign the first user found
        } catch {
            print("Failed to fetch user: \(error)")
        }
    }
}



#Preview {
    ArtistGridView()
}
