//
//  GenreViewModel.swift
//  Resonate
//
//  Created by Sebastian Presno on 13/10/24.
//

import Foundation
import SwiftUI


class GenreViewModel: ObservableObject {
    @Published var genres: [Genre]
    
    init(genres: [Genre] = []) {
        self.genres = genres
    }
    
    // Example: Add a new genre
    func addGenre(_ genre: Genre) {
        genres.append(genre)
    }
    
    // Example: Update a genre at a given index
    func updateGenre(at index: Int, with genre: Genre) {
        guard genres.indices.contains(index) else { return }
        genres[index] = genre
    }
    
    // Example: Remove a genre
    func removeGenre(at index: Int) {
        guard genres.indices.contains(index) else { return }
        genres.remove(at: index)
    }
}
