//
//  Artist.swift
//  Resonate
//
//  Created by Sebastian Presno on 11/10/24.
//

import Foundation
import SwiftData
import SwiftUI

// Lista para pre-popular el Modelo de ArtistSwiftData
var artistSwiftDataInit: [ArtistSwiftData] = [
    ArtistSwiftData(name: "John Mayer", info: "Singer, songwriter, and guitarist", image: "charlixcx", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Taylor Swift", info: "Singer-songwriter and record producer", image: "charlixcx", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Beethoven", info: "German composer and pianist", image: "charlixcx", genre: "Classical"), // Classical
    ArtistSwiftData(name: "Julio Iglesias", info: "Electronic music duo", image: "charlixcx", genre: "Electronic"), // Electronic,
    ArtistSwiftData(name: "Charli XCX", info: "Singer, songwriter, and guitarist", image: "charlixcx", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Sprite", info: "Singer-songwriter and record producer", image: "charlixcx", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Dr Pepper", info: "German composer and pianist", image: "charlixcx", genre: "Classical"), // Classical
    ArtistSwiftData(name: "Fanta", info: "Electronic music duo", image: "charlixcx", genre: "Electronic"), // Electronic,
    ArtistSwiftData(name: "Pepsi", info: "Singer, songwriter, and guitarist", image: "charlixcx", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Coca Cola", info: "Singer-songwriter and record producer", image: "charlixcx", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Queen of Queens", info: "Electronic music duo", image: "charlixcx", genre: "Electronic") // Electronic
]

@Model
class ArtistSwiftData {
    @Attribute(.unique) var id = UUID()
    var name: String
    var info: String
    var image: String?
    var genre: String
    
    init(name: String, info: String, image: String? = nil, genre: String) {
        self.id = UUID()
        self.name = name
        self.info = info
        self.image = image
        self.genre = genre
    }
    
    // Static method to create a fetch request
    static func fetchRequest() -> FetchDescriptor<UserSwiftData> {
        return FetchDescriptor<UserSwiftData>()
    }
}

// ESTO REALMENTE NO SE USA
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
