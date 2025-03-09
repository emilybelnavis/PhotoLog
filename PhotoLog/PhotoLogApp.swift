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
    var container: ModelContainer
    init() {
        do {
            let configFilmStock = ModelConfiguration(for: FilmStock.self)
            let configReels = ModelConfiguration(for: Reel.self)
            let configLogEntry = ModelConfiguration(for: LogEntry.self)

            container = try ModelContainer(for: FilmStock.self, Reel.self, LogEntry.self, configurations: configFilmStock, configReels, configLogEntry)
        } catch {
            fatalError("Failed to configure SwiftData container: \(error)")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FilmStock.self) { result in
            do {
                let container = try result.get()

                let descriptor = FetchDescriptor<FilmStock>()
                let filmStocksInContainer = try container.mainContext.fetch(descriptor)

                guard let jsonUrl = Bundle.main.url(forResource: "filmStocks", withExtension: "json") else {
                    fatalError("failed to find filmStocks.json")
                }

                let jsonData = try Data(contentsOf: jsonUrl)
                let filmStocks = try JSONDecoder().decode([FilmStock].self, from: jsonData)

                let existingFilmStockNames = Set(filmStocksInContainer.map { $0.id })
                let newFilmStocks = filmStocks.filter { !existingFilmStockNames.contains($0.id) }

                for filmStock in newFilmStocks {
                    container.mainContext.insert(filmStock)
                }

                try container.mainContext.save()

            } catch {
                print("Failed to pre-seed database: \(error)")
            }
        }

    }

}
