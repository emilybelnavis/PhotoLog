//
//  ReelData.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//
//  SwiftData model for reels
import Foundation
import SwiftData

@Model
final class Reel {
    @Attribute(.unique) var id: String
    var reelNumber: Int
    var filmStock: FilmStock
    var exposureCount: Int
    var photos: [LogEntry]?
    
    init(
        id: String = "",
        reelNumber: Int = 0,
        filmStock: FilmStock = FilmStock(id: "kodakGold", brand: "", stockName: "", speed: 0, exposureCount: 0, type: "", format: "", group: "", dataSource: "", assetId: ""),
        exposureCount: Int = 0,
        logEntry: [LogEntry]? = nil
    ) {
        self.id = id
        self.reelNumber = reelNumber
        self.filmStock = filmStock
        self.exposureCount = exposureCount
        self.photos = logEntry
    }
}
