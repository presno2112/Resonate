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
    // Existing artists from the previous array
    ArtistSwiftData(name: "2Pac", info: "Legendary rapper and actor", image: "2pac", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Twenty One Pilots", info: "Alternative rock and pop duo", image: "21pilots", genre: "Alternative"), // Alternative
    ArtistSwiftData(name: "Aerosmith", info: "American rock band", image: "aerosmith", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Arcade Fire", info: "Indie rock band", image: "arcadefire", genre: "Indie Rock"), // Indie Rock
    ArtistSwiftData(name: "Arctic Monkeys", info: "English rock band", image: "arctic_monkeys", genre: "Indie Rock"), // Indie Rock
    ArtistSwiftData(name: "Ariana Grande", info: "Pop and R&B singer", image: "ariana grande", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Bad Bunny", info: "Reggaeton and Latin trap artist", image: "bad bunny", genre: "Latin"), // Latin
    ArtistSwiftData(name: "The Beatles", info: "Iconic British rock band", image: "beatles", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Billie Eilish", info: "Singer and songwriter", image: "billieeilish", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Blur", info: "English rock band", image: "blur", genre: "Alternative Rock"), // Alternative Rock
    ArtistSwiftData(name: "BTS", info: "South Korean boy band", image: "bts", genre: "K-Pop"), // K-Pop
    ArtistSwiftData(name: "Creedence", info: "American rock band", image: "creedence", genre: "Rock"), // Rock
    ArtistSwiftData(name: "The Doors", info: "American rock band", image: "doors", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Dua Lipa", info: "Pop singer and songwriter", image: "dualipa", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Ed Sheeran", info: "English singer-songwriter", image: "edsheeran", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Eminem", info: "Rapper, songwriter, and record producer", image: "eminem", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Fleetwood Mac", info: "British-American rock band", image: "fleetwoodmac", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Future", info: "American rapper and singer", image: "future", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Green Day", info: "American punk rock band", image: "green day", genre: "Punk Rock"), // Punk Rock
    ArtistSwiftData(name: "Guns N' Roses", info: "American hard rock band", image: "guns", genre: "Hard Rock"), // Hard Rock
    ArtistSwiftData(name: "Harry Styles", info: "Singer, songwriter, and actor", image: "harry style", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Interpol", info: "American rock band", image: "interpol", genre: "Indie Rock"), // Indie Rock
    ArtistSwiftData(name: "Iron Maiden", info: "British heavy metal band", image: "ironmaiden", genre: "Heavy Metal"), // Heavy Metal
    ArtistSwiftData(name: "J Balvin", info: "Reggaeton singer and rapper", image: "jbalvin", genre: "Reggaeton"), // Reggaeton
    ArtistSwiftData(name: "J. Cole", info: "Rapper, singer, and producer", image: "jcole", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Jimi Hendrix", info: "American rock guitarist and singer", image: "jim hendrix", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Kanye West", info: "Rapper, record producer, and fashion designer", image: "kanye", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Kendrick Lamar", info: "Rapper, songwriter, and record producer", image: "kendrick", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "The Killers", info: "American rock band", image: "killers", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Kiss", info: "American rock band", image: "kiss", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Lady Gaga", info: "Pop singer and songwriter", image: "ladygaga", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Lana Del Rey", info: "Pop and rock singer-songwriter", image: "lanadelrey", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Led Zeppelin", info: "British rock band", image: "ledzepelin", genre: "Hard Rock"), // Hard Rock
    ArtistSwiftData(name: "Lil Wayne", info: "American rapper and singer", image: "lil wayne", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Maroon 5", info: "Pop rock band", image: "maroon5", genre: "Pop Rock"), // Pop Rock
    ArtistSwiftData(name: "Marshmello", info: "Electronic music producer and DJ", image: "marshmello", genre: "Electronic"), // Electronic
    ArtistSwiftData(name: "Metallica", info: "American heavy metal band", image: "metallica", genre: "Heavy Metal"), // Heavy Metal
    ArtistSwiftData(name: "Michael Jackson", info: "Pop legend, singer, and dancer", image: "michaeljackson", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Miley Cyrus", info: "Pop singer and actress", image: "mileycirus", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Nirvana", info: "American grunge band", image: "nirvana", genre: "Grunge"), // Grunge
    ArtistSwiftData(name: "The Notorious B.I.G.", info: "American rapper and songwriter", image: "notoriousbig", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Oasis", info: "English rock band", image: "oasis", genre: "Rock"), // Rock

    // New artists from the second screenshot
    ArtistSwiftData(name: "Peso Pluma", info: "Regional Mexican singer and songwriter", image: "pesopluma", genre: "Regional Mexican"), // Regional Mexican
    ArtistSwiftData(name: "Pink Floyd", info: "English rock band known for progressive and psychedelic music", image: "pinkfloyd", genre: "Progressive Rock"), // Progressive Rock
    ArtistSwiftData(name: "Queen", info: "British rock band known for their versatility", image: "queen", genre: "Rock"), // Rock
    ArtistSwiftData(name: "Radiohead", info: "English rock band known for their experimental music", image: "radiohead", genre: "Alternative Rock"), // Alternative Rock
    ArtistSwiftData(name: "Rihanna", info: "Singer, actress, and businesswoman", image: "rihanna", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Shakira", info: "Colombian singer and dancer", image: "shakira", genre: "Pop"), // Pop
    ArtistSwiftData(name: "Snoop Dogg", info: "Rapper, songwriter, and actor", image: "snoopdog", genre: "Hip-hop"), // Hip-hop
    ArtistSwiftData(name: "Soda Stereo", info: "Argentinian rock band", image: "sodastereo", genre: "Rock"), // Rock
    ArtistSwiftData(name: "The Strokes", info: "American rock band", image: "strokes", genre: "Indie Rock"), // Indie Rock
    ArtistSwiftData(name: "Taylor Swift", info: "Singer-songwriter and record producer", image: "taylorswift", genre: "Pop"), // Pop
    ArtistSwiftData(name: "The Cure", info: "English rock band known for their post-punk and gothic rock", image: "thecure", genre: "Gothic Rock"), // Gothic Rock
    ArtistSwiftData(name: "U2", info: "Irish rock band", image: "u2", genre: "Rock"), // Rock
    ArtistSwiftData(name: "The Weeknd", info: "Canadian singer and songwriter", image: "weekend", genre: "R&B"), // R&B
    ArtistSwiftData(name: "Weezer", info: "American rock band", image: "weezer", genre: "Alternative Rock") // Alternative Rock
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
