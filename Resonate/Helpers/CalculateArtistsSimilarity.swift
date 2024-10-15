//
//  CalculateArtistsSimilarity.swift
//  Resonate
//
//  Created by Sebastian Presno on 15/10/24.
//

import Foundation

// Function to calculate similarity between arrays of Artist objects based on their names
func calculateArtistSimilarityPercentage(array1: [Artist], array2: [Artist]) -> Double {
    // Extract the artist names from each array
    let names1 = array1.map { $0.name }
    let names2 = array2.map { $0.name }
    
    // Convert the names to sets
    let set1 = Set(names1)
    let set2 = Set(names2)
    
    // Find the common elements (matching names)
    let commonElements = set1.intersection(set2)
    
    // Use the smaller set's count for the percentage calculation
    let smallerSetCount = min(set1.count, set2.count)
    
    // Avoid division by zero, return 0% if the smaller array is empty
    guard smallerSetCount > 0 else {
        return 0.0
    }
    
    // Calculate the similarity percentage
    let percentage = (Double(commonElements.count) / Double(smallerSetCount)) * 100.0
    
    return percentage
}
