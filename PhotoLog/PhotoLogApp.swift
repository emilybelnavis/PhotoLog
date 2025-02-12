//
//  PhotoLogApp.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import SwiftUI
import SwiftData

@main
struct PhotoLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FilmStock.self) { result in
            do {
                let container = try result.get()
                
                // Fetch and delete items where dataSource is "system"
                let fetchRequest = FetchDescriptor<FilmStock>(predicate: #Predicate {$0.dataSource == "system"})
                let itemsToDelete = try container.mainContext.fetch(fetchRequest)
                
                for item in itemsToDelete {
                    container.mainContext.delete(item)
                }
                
                guard let dataUrl = Bundle.main.url(forResource: "filmStocks", withExtension: "json") else {
                    fatalError("Failed to find filmStocks.json")
                }
                
                let data = try Data(contentsOf: dataUrl)
                let decodedData = try JSONDecoder().decode([FilmStock].self, from: data)
                
                for filmStock in decodedData {
                    container.mainContext.insert(filmStock)
                }
                
                // Save the context after deletion
                try container.mainContext.save()
                
            } catch {
                fatalError("Failed to delete items from the database. \(error)")
            }
        }
    }
}
