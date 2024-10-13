//
//  UserViewModel.swift
//  Resonate
//
//  Created by Sebastian Presno on 13/10/24.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [User]
    
    init(users: [User] = []) {
        self.users = users
    }
    
    // Example: Add a new user
    func addUser(_ user: User) {
        users.append(user)
    }
    
    // Example: Update a user at a given index
    func updateUser(at index: Int, with user: User) {
        guard users.indices.contains(index) else { return }
        users[index] = user
    }
    
    // Example: Remove a user
    func removeUser(at index: Int) {
        guard users.indices.contains(index) else { return }
        users.remove(at: index)
    }
}

