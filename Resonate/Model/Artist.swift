//
//  Artist.swift
//  Resonate
//
//  Created by Sebastian Presno on 11/10/24.
//

import Foundation


struct Artist: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var image: String?  // Optional image URL or data
    var genre: Genre
    
    static func == (lhs: Artist, rhs: Artist) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Artist {
    static let sampleData: [Artist] = [
        Artist(name: "John Mayer", description: "Singer, songwriter, and guitarist", image: nil, genre: Genre.sampleGenres[0]), // Rock
        Artist(name: "Taylor Swift", description: "Singer-songwriter and record producer", image: nil, genre: Genre.sampleGenres[1]), // Pop
        Artist(name: "Beethoven", description: "German composer and pianist", image: nil, genre: Genre.sampleGenres[2]), // Classical
        Artist(name: "Daft Punk", description: "Electronic music duo", image: nil, genre: Genre.sampleGenres[3]), // Electronic,
        Artist(name: "John Mayer", description: "Singer, songwriter, and guitarist", image: nil, genre: Genre.sampleGenres[0]), // Rock
        Artist(name: "Taylor Swift", description: "Singer-songwriter and record producer", image: nil, genre: Genre.sampleGenres[1]), // Pop
        Artist(name: "Beethoven", description: "German composer and pianist", image: nil, genre: Genre.sampleGenres[2]), // Classical
        Artist(name: "Daft Punk", description: "Electronic music duo", image: nil, genre: Genre.sampleGenres[3]), // Electronic,
        Artist(name: "John Mayer", description: "Singer, songwriter, and guitarist", image: nil, genre: Genre.sampleGenres[0]), // Rock
        Artist(name: "Taylor Swift", description: "Singer-songwriter and record producer", image: nil, genre: Genre.sampleGenres[1]), // Pop
        Artist(name: "Beethoven", description: "German composer and pianist", image: nil, genre: Genre.sampleGenres[2]), // Classical
        Artist(name: "Daft Punk", description: "Electronic music duo", image: nil, genre: Genre.sampleGenres[3]) // Electronic
    ]
}
