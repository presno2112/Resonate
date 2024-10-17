//
//  ResonateApp.swift
//  Resonate
//
//  Created by Sebastian Presno on 08/10/24.
//

import SwiftUI
import SwiftData

@main
struct ResonateApp: App {
//    let container: ModelContainer = {
//        let schema = Schema([ArtistSwiftData.self, UserSwiftData.self])
//        do {
//            let container = try ModelContainer(for: schema, configurations: [])
//            return container
//        } catch {
//            // Handle the error appropriately, for example:
//            print("Failed to create ModelContainer: \(error)")
//            // You may want to return a default container or handle this differently
//            fatalError("Could not create ModelContainer")
//        }
//    }()
    
    // Logica para pre-popular a ArtistSwiftData con la lista de artistas cuando iniciamos
    // la aplicación
    @MainActor
    let appContainer: ModelContainer = {
        do {
            let container = try ModelContainer(for: ArtistSwiftData.self, UserSwiftData.self)
            
            // Make sure the persistent store is empty. If it's not, return the non-empty container.
            var itemFetchDescriptor = FetchDescriptor<ArtistSwiftData>()
            itemFetchDescriptor.fetchLimit = 1
            
            guard try container.mainContext.fetch(itemFetchDescriptor).count == 0 else { return container }
            
            for item in artistSwiftDataInit {
                let newArtist = ArtistSwiftData(name: item.name, info: item.info, image: item.image, genre: item.genre)
                container.mainContext.insert(newArtist)
            }
            return container
        } catch {
            fatalError("Failed to create container")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ProfileView()
        }
        // Esto nos permite usar cualquier modelo creado en SwiftData en nuestros views
        .modelContainer(appContainer)
    }
}
