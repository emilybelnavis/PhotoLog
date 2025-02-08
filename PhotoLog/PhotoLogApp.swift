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
                
                // check to see if this information has already been added
                let descriptor = FetchDescriptor<FilmStock>()
                let existingData = try container.mainContext.fetchCount(descriptor)
                guard existingData == 0 else { return }
                
                guard let url = Bundle.main.url(forResource: "filmStocks", withExtension: "json") else {
                    fatalError("Failed to find filmStocks.json")
                }
                
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([FilmStock].self, from: data)
                
                for filmStock in decodedData {
                    container.mainContext.insert(filmStock)
                }
            } catch {
                fatalError("Failed to pre-seed database. \(error)")
            }
        }
    }
}
