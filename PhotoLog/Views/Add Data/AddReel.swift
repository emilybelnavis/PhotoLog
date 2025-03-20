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
    @State var reelName: String = ""
    @State var reelNotes: String = ""
    @State var showError: Bool = false
    @Query(sort: [SortDescriptor(\FilmStock.brand), SortDescriptor(\FilmStock.stockName)]) var filmStocks: [FilmStock]
    @Query private var reels: [Reel]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Reel Name", text: $reelName)
                Picker("Film Stock", selection: $selectedFilmStock) {
                    ForEach(filmStocks, id: \.self) {
                        FilmStockItem(filmStock: $0)
                            .tag($0 as FilmStock?)
                    }
                }
                .pickerStyle(NavigationLinkPickerStyle())
                TextField("Notes", text: $reelNotes)
                Button("Add new reel") {
                    withAnimation {
                        let reelNumber = reels.count + 1
                        
                        if reelName.isEmpty {
                            reelName = "Untitled Reel"
                        }
                        
                        if reelNotes.isEmpty {
                            reelNotes = ""
                        }
                        
                        if selectedFilmStock == nil {
                            showError = true
                        } else {
                            let reel = Reel(reelName: reelName, reelNotes: reelNotes, reelNumber: reelNumber, filmStock: selectedFilmStock!, exposureCount: 0, photos: [])
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
