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
