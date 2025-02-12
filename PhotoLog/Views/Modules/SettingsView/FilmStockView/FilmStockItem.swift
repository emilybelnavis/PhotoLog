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
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } else {
                Image(systemName: "film")
            }
            VStack(alignment: .leading) {
                Text("\(filmStock.brand) \(filmStock.stockName) (\(filmStock.format))")
                HStack {
                    Text("ISO \(filmStock.speed)")
                    Text(filmStock.type)
                }
                if(filmStock.exposureCount == 24 || filmStock.exposureCount == 36) {
                    Text("\(filmStock.exposureCount!) exposures")
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FilmStock.self, configurations: config)
    
    let filmStock = FilmStock(id: "kodakEktachrome_35mm", brand: "Kodak", stockName: "Ektachrome", speed: 100, exposureCount: 36, type: "Slide/Colour Reversal", format: "35mm", group: "kodak", dataSource: "system", assetId: "kodakEktachrome_35mm")
    FilmStockItem(filmStock: filmStock)
        .modelContainer(container)
}
