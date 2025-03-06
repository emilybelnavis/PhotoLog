//
//  DefaultFilmStocksSamples.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-11.
//

import Foundation

extension FilmStock {
    static var sampleFilmStocks: [FilmStock] {
        [
            FilmStock(id: "kodakEktachrome_35mm", brand: "Kodak", stockName: "Ektachrome", speed: 100, exposureCount: 0, type: "Slide/Colour Reversal", format: "35mm", assetId: "kodakEktachrome_35mm"),
            FilmStock(id: "ilfordOrthoPlus_35mm", brand: "Ilford", stockName: "Ortho Plus", speed: 80, exposureCount: 36, type: "Black & White", format: "35mm", assetId: "ilfordOrthoPlus_35mm")
        ]
    }
}
