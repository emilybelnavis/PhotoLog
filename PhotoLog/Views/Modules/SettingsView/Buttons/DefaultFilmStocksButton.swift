//
//  DefaultFilmStocksButton.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftUI

struct DefaultFilmStocksButton: View {
    var body: some View {
        NavigationLink {
            DefaultFilmStockView()
        } label: {
            HStack {
                Image(systemName: "film")
                Text("Default Film Stocks")
            }
            .foregroundStyle(.secondary)
        }
    }
}

struct FilmStocksButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultFilmStocksButton()
    }
}
