//
//  ReelItem.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-12.
//

import SwiftUI
import SwiftData

struct ReelItem: View {
    @Environment(\.modelContext) var context
    
    var reel: Reel
    
    var body: some View {
        NavigationLink {
            ReelView()
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(reel.id)
                        .font(.system(size: 24, weight: .bold))
                    Text("\(reel.filmStock.brand) \(reel.filmStock.stockName)")
                    Text("\(reel.exposureCount) photos shot")
                }
                Spacer()
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Reel.self, configurations: config)
    
    let filmStock = FilmStock(id: "kodakEktachrome_35mm", brand: "Kodak", stockName: "Ektachrome", speed: 100, exposureCount: 36, type: "Slide/Colour Reversal", format: "35mm", group: "kodak", dataSource: "system", assetId: "kodakEktachrome_35mm")
    
    let reel = Reel(id: "A001", reelNumber: 1, filmStock: filmStock, exposureCount: 36, logEntry: nil)
    
    ReelItem(reel: reel)
        .modelContainer(container)
}
