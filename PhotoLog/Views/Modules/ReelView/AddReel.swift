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

    @State var selectedFilmStock: FilmStock?
    @State var showError: Bool = false
    @Query(sort: [SortDescriptor(\FilmStock.brand), SortDescriptor(\FilmStock.stockName)]) var filmStocks: [FilmStock]
    @Query private var reels: [Reel]
    
    var body: some View {
        VStack {
            List {
                Picker("Film Stock", selection: $selectedFilmStock) {
                    ForEach(filmStocks, id: \.self) { filmStock in
                        Text("\(filmStock.brand) \(filmStock.stockName) \(filmStock.format)").tag(filmStock as FilmStock?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                Button("Add new reel") {
                    withAnimation {
                        let reelNumber = reels.count + 1
                        if selectedFilmStock == nil {
                            showError = true
                        } else {
                            let reel = Reel(id: UUID().uuidString, reelNumber: reelNumber, filmStock: selectedFilmStock!, exposureCount: 0)
                            context.insert(reel)
                            try? context.save()
                            dismiss()
                        }
                    }
                }
                .alert("No film stock specified", isPresented: $showError) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("You cannot create a reel without a film stock. Please select one from the dropdown list.")
                }
            }
        }
    }
}
