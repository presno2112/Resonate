//
//  ResonationViewModel.swift
//  Resonate
//
//  Created by Sebastian Presno on 13/10/24.
//

import Foundation
import SwiftUI


class ResonationViewModel: ObservableObject {
    @Published var resonations: [Resonation]
    
    init(resonations: [Resonation] = []) {
        self.resonations = resonations
    }
    
    // Example: Add a new resonation
    func addResonation(_ resonation: Resonation) {
        resonations.append(resonation)
    }
    
    // Example: Update a resonation at a given index
    func updateResonation(at index: Int, with resonation: Resonation) {
        guard resonations.indices.contains(index) else { return }
        resonations[index] = resonation
    }
    
    // Example: Remove a resonation
    func removeResonation(at index: Int) {
        guard resonations.indices.contains(index) else { return }
        resonations.remove(at: index)
    }
}
