//
//  Resonation.swift
//  Resonate
//
//  Created by Sebastian Presno on 11/10/24.
//

import Foundation

struct Resonation: Identifiable, Codable, Equatable {
    var id = UUID()
    var user1: User
    var user2: User
    var correlation: Float  // Percentage correlation, e.g., 0.75 for 75%
    
    static func == (lhs: Resonation, rhs: Resonation) -> Bool {
        return lhs.id == rhs.id
    }
}
