//
//  ReelView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-12.
//

import SwiftUI
import SwiftData

struct ReelView: View {
    @Query var reels: [Reel]
    @State private var showAddEntry = false
    
    var body: some View {
        HStack {
            Text("Reels").font(.system(size: 32, weight: .bold))
            Spacer()
            Button(action: { showAddEntry.toggle() }) {
                Image(systemName: "plus")
            }
        }
        .padding(.horizontal, 20)
        List {
            ForEach(reels) { reel in
                ReelItem(reel: reel)
            }
        }
        .sheet(isPresented: $showAddEntry, content: {
            NavigationStack {
                AddReel()
            }
            .presentationDetents([.medium])
        })
    }
}
