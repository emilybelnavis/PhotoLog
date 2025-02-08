//
//  FilmStockView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftUI
import SwiftData

struct FilmStockView: View {
    @Query var filmStocks: [FilmStock]
    var body: some View {
        List(filmStocks) { filmStock in
            FilmStockItem(filmStock: filmStock)
        }
    }
}
