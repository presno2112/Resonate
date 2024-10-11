//
//  User.swift
//  Resonate
//
//  Created by Sebastian Presno on 11/10/24.
//

import Foundation


struct User: Identifiable, Codable, Equatable {
    var id = UUID()  // Unique identifier
    var name: String
    var surname: String
    var description: String
    var picture: String?  // URL or base64 image string
    
    var artists: [Artist]
    var genres: [Genre]
    var resonations: [Resonation]  // Relations with other users
    
    // Equatable allows easy comparison between users
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
