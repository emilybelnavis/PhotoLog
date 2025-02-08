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
    var id: String
    var reelNumber: Int
    var filmStock: FilmStock
    var exposureCount: Int
    var photos: [LogEntry]?
    
    init(
        id: String = UUID().uuidString,
        reelNumber: Int,
        filmStock: FilmStock,
        exposureCount: Int,
        logEntry: [LogEntry]?
    ) {
        self.id = id
        self.reelNumber = reelNumber
        self.filmStock = filmStock
        self.exposureCount = exposureCount
        self.photos = logEntry
    }
}
