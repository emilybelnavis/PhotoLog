//
//  DefaultFilmStockView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftUI
import SwiftData

struct DefaultFilmStockView: View {
    @Query(filter: #Predicate<FilmStock> { stock in stock.dataSource == "system"}, sort: \FilmStock.stockName) var filmStocks: [FilmStock]
    
    var brands: [String] {
        filmStocks.map { $0.brand }.uniqueValues()
    }
    
    var body: some View {
        List {
            ForEach(brands.sorted(), id: \.self) { brand in
                Section(header: Text(brand)) {
                    ForEach(filmStocks.filter { $0.brand == brand }) { filmStock in
                        FilmStockItem(filmStock: filmStock)
                    }
                }
            }
        }
    }
}
