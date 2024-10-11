//
//  Genre.swift
//  Resonate
//
//  Created by Sebastian Presno on 11/10/24.
//

import Foundation

struct Genre: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var image: String?  // Optional image, like an icon
    
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id
    }
}
