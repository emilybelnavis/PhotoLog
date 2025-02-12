//
//  LogEntry.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftData
import CoreLocation

@Model
final class LogEntry {
    var id: String
    var reel: Reel
    var filmStock: FilmStock
    var entryTitle: String
    var imageName: String
    var timestamp: Date
    
    // Flags
    var isDeveloped: Bool
    var isScanned: Bool
    var isFavourite: Bool
    
    init(
        id: String = UUID().uuidString,
        reel: Reel,
        filmStock: FilmStock,
        entryTitle: String = "",
        imageName: String = "",
        timestamp: Date = Date(),
        isDeveloped: Bool = false,
        isScanned: Bool = false,
        isFavourite: Bool = false
    ) {
        self.id = id
        self.reel = reel
        self.filmStock = filmStock
        self.entryTitle = entryTitle
        self.imageName = imageName
        self.timestamp = timestamp
        self.isDeveloped = isDeveloped
        self.isScanned = isScanned
        self.isFavourite = isFavourite
    }
}
