//
//  ArtistViewModel.swift
//  Resonate
//
//  Created by Sebastian Presno on 13/10/24.
//

import Foundation
import SwiftUI


class ArtistViewModel: ObservableObject {
    @Published var artists: [Artist]
    
    init(artists: [Artist] = Artist.sampleData) {
        self.artists = artists
    }
    
    // Example: Add a new artist
    func addArtist(_ artist: Artist) {
        artists.append(artist)
    }
    
    // Example: Update an artist at a given index
    func updateArtist(at index: Int, with artist: Artist) {
        guard artists.indices.contains(index) else { return }
        artists[index] = artist
    }
    
    // Example: Remove an artist
    func removeArtist(at index: Int) {
        guard artists.indices.contains(index) else { return }
        artists.remove(at: index)
    }
}
