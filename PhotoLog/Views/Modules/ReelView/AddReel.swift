//
//  AddReel.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-12.
//

import SwiftUI
import SwiftData

struct AddReel: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var reel = Reel()

    @Query(sort: [SortDescriptor(\FilmStock.brand), SortDescriptor(\FilmStock.stockName)]) var filmStocks: [FilmStock]
    
    var brands: [String] {
        filmStocks.map { $0.brand }.uniqueValues()
    }
    let descriptor = FetchDescriptor<Reel>()
    
    var body: some View {
        List {
            Section(header: Text("Reel Information")) {
                TextField("Reel ID", text: $reel.id).tag($reel.id)
                Picker("Film Stock", selection: $reel.filmStock.stockName) {
                    ForEach(filmStocks, id: \.self.id) { filmStock in
                        Text("\(filmStock.brand) \(filmStock.stockName) \(filmStock.format)").tag(filmStock.id)
                    }
                }.onAppear() {
                    self.reel.filmStock.id = "Gold 200"
                }
            }
            Button("Add new reel") {
                withAnimation {
                    context.insert(reel)
                }
                dismiss()
            }
        }
        .navigationTitle("Add a new reel")
        .navigationBarTitleDisplayMode(.inline)
    }
}
