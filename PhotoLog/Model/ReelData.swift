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
    var reelName: String
    var reelNotes: String
    var reelNumber: Int?
    var filmStock: FilmStock
    var exposureCount: Int
    var photos: [LogEntry]?

    init(
        reelName: String,
        reelNotes: String,
        reelNumber: Int,
        filmStock: FilmStock,
        exposureCount: Int,
        photos: [LogEntry] = []
    ) {
        self.id = UUID().uuidString
        self.reelName = reelName
        self.reelNotes = reelNotes
        self.reelNumber = reelNumber
        self.filmStock = filmStock
        self.exposureCount = exposureCount
        self.photos = photos
    }
}
