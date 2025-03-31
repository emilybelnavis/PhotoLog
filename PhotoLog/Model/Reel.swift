//
//  Reel.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//
//  SwiftData model for reels
import Foundation
import SwiftData

@Model
final class Reel {
    var id: String = ""
    var reelName: String = ""
    var reelNotes: String = ""
    var reelNumber: Int = 0
    var exposureCount: Int?
    var filmStock: FilmStock?
    var photos: [Photo]?

    
    init(
        reelName: String,
        reelNotes: String,
        reelNumber: Int,
        exposureCount: Int,
        filmStock: FilmStock?,
        photos: [Photo] = []
    ) {
        self.id = UUID().uuidString
        self.reelName = reelName
        self.reelNotes = reelNotes
        self.reelNumber = reelNumber
        self.exposureCount = exposureCount
        self.filmStock = filmStock
        self.photos = photos
    }
}
