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
            ReelDetailView(reel: reel)
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(reel.reelName)
                        .font(.title2)
                    Text("Shot on \(reel.filmStock!.brand) \(reel.filmStock!.stockName)")
                    if(reel.reelNotes != "") {
                        Text("\(reel.reelNotes)")
                    }
                    Text("\(reel.exposureCount) photos shot")
                }
            }
            Spacer()
        }
        .foregroundStyle(.black)
        .background(Color.white)
        .swipeActions(edge: .trailing) {
            Button("Delete", systemImage: "trash", role: .destructive) {
                context.delete(reel)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Reel.self, configurations: config)

    let filmStock = FilmStock(id: "kodakEktachrome_35mm", brand: "Kodak", stockName: "Ektachrome", speed: 100, exposureCount: 36, type: "Slide/Colour Reversal", format: "35mm", assetId: "kodakEktachrome_35mm")

    let reel = Reel(reelName: "Test Reel", reelNotes: "This is a test reel", reelNumber: 1, exposureCount: 36, filmStock: filmStock, photos: [])

    ReelItem(reel: reel)
        .modelContainer(container)
}
