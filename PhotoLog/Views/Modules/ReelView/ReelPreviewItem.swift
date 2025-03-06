//
//  ReelPreviewItem.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-06.
//

import SwiftUI
import SwiftData

struct ReelPreviewItem: View {
    @Environment(\.modelContext) var modelContext
    @State var reel: Reel
    
    var body: some View {
        NavigationLink {
            ReelDetailView(reel: reel)
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
