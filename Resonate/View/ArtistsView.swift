//
//  ArtistsView.swift
//  Resonate
//
//  Created by Sebastian Presno on 14/10/24.
//

import SwiftUI

struct ArtistGridView: View {
    @StateObject var viewModel = ArtistViewModel() // Initialize with sample data
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ] // Adjust number of columns based on desired layout
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Find your favorite artist", text: .constant(""))
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding()

                // Grid of artist bubbles
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.artists) { artist in
                            VStack {
                                if let imageName = artist.genre.image {
                                    // Bubble with artist image
                                    Image(imageName) // Assuming you have image assets named like "rock_icon"
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.blue, lineWidth: 2)) // Optional border around the bubble
                                } else {
                                    // Placeholder bubble
                                    Circle()
                                        .fill(Color.purple.opacity(0.4))
                                        .frame(width: 80, height: 80)
                                }
                                
                                // Artist's name below the bubble
                                Text(artist.name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding()
                }
            }
            .background(Color.purple.opacity(0.2)) // Background color to match your design
            .navigationTitle("Artists")
        }
    }
}

#Preview {
    ArtistGridView()
}
