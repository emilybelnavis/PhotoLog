//
//  FilmStocksButton.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftUI

struct FilmStocksButton: View {
    var body: some View {
        NavigationLink {
            FilmStockView()
        } label: {
            HStack {
                Image(systemName: "film")
                Text("Film Stocks")
            }
            .foregroundStyle(.secondary)
        }
    }
}

struct FilmStocksButton_Previews: PreviewProvider {
    static var previews: some View {
        FilmStocksButton()
    }
}
