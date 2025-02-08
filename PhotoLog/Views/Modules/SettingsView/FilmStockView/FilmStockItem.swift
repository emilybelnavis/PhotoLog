//
//  FilmStockItem.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import SwiftUI
import SwiftData

struct FilmStockItem: View {
    @Environment(\.modelContext) var context
    
    var filmStock: FilmStock
    
    var body: some View {
        HStack {
            if (filmStock.assetId != nil ) {
                Image(filmStock.assetId!)
            } else {
                Image(systemName: "film")
            }
            VStack(alignment: .leading) {
                Text("\(filmStock.brand) \(filmStock.stockName)")
                HStack {
                    Text("ISO: \(filmStock.stockName)")
                    Text("\(String(describing: filmStock.exposureCount)) exposures")
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FilmStock.self, configurations: config)
    
    let filmStock = FilmStock(id: "kodakEktachrome_35mm", brand: "Kodak", stockName: "Ektachrome", speed: 100, exposureCount: 36, type: "slide", format: "35mm", assetId: "kodakEktachrome_35mm")
    FilmStockItem(filmStock: filmStock)
        .modelContainer(container)
}
