//
//  ReelView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-12.
//

import Foundation
import SwiftUI
import SwiftData

struct ReelPreviewView: View {
    static var fetchDescriptor: FetchDescriptor<Reel> {
        var descriptor = FetchDescriptor<Reel>(sortBy: [SortDescriptor(\.reelNumber, order: .forward)])
        descriptor.fetchLimit = 3
        return descriptor
    }
    
    @Query(fetchDescriptor) var reels: [Reel]
    
    @Environment(\.modelContext) var context
    @State private var showAddEntry = false
    
    func debug() {
        print(reels.count)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Reels").font(.system(size: 32, weight: .bold))
                Spacer()
                Button(action: { showAddEntry.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            Spacer()
            List {
                Text("test")
                ForEach(reels) { reel in
                    Text(reel.id)
                }
                NavigationLink { ReelView() } label: {
                    HStack {
                        Text("View All Reels")
                    }
                    .foregroundStyle(.primary)
                }
            }
        }
        .sheet(isPresented: $showAddEntry, content: {
            NavigationStack {
                AddReel()
            }
            .presentationDetents([.medium])
        })
        .onAppear(perform: debug)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Reel.self, configurations: config)
    
    let filmStock = FilmStock(id: "kodakEktachrome_35mm", brand: "Kodak", stockName: "Ektachrome", speed: 100, exposureCount: 36, type: "Slide/Colour Reversal", format: "35mm", assetId: "kodakEktachrome_35mm")
    
    let reel = [Reel(id: "A001", reelNumber: 1, filmStock: filmStock, exposureCount: 36)]
    ReelPreviewView()
        .modelContainer(container)
}
