//
//  ArtistsView.swift
//  Resonate
//
//  Created by Sebastian Presno on 14/10/24.
//

import SwiftUI
import SwiftData

struct ArtistGridView: View {
    // Context environment, parecido al modelContainer en donde se
    // define la app, nos permite usar los modelos definidos
    @Environment(\.modelContext) var context
    // En este query estamos fetching a todos los artistas y ordenandolos
    // por nombre
    @Query(sort: \ArtistSwiftData.name) var dataArtists: [ArtistSwiftData]
    // Variable que estoy usando para testear que estamos obteniendo el
    // primer usuario del modelo con la funcion fetchFirstUser()
    @State private var fetchedUser: UserSwiftData? = nil
    
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
                        ForEach(dataArtists) { artist in
                            VStack {
                                Button(action: {
                                    print("Tapped \(artist.name)")
                                    if let fetchedUser {
                                        fetchedUser.artists.append(artist)
                                        try! context.save()
                                    } else {
                                        print("No user found")
                                    }
                                }) {
                                    Image("charlixcx") // Assuming you have image assets named like "rock_icon"
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
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
            .background(Color.purple.opacity(0.2))
            .navigationTitle("Artists")
        }
        .onAppear {
            saveDummyUser()
            fetchFirstUser()
        }
    }
    
    // Funcion para crear un usuario dummy para poder probar el
    // insertar un artista en su arreglo de artistas
    private func saveDummyUser() {
        let newUser = UserSwiftData(name: "Gustavo", username: "gus.vasac", artists: [])
        context.insert(newUser)
    }
    
    // Funcion para obtener el primer usuario del modelo
    // UserSwiftData
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
