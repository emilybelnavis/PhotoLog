//
//  LogEntry.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftData

@Model
final class LogEntry {
    var id: String
    var reel: Reel
    var filmStock: FilmStock
    var entryTitle: String
    var imageName: String
    var location: [String]
    var timestamp: Date
    var isFavourite: Bool
    
    init(
        id: String = UUID().uuidString,
        reel: Reel,
        filmStock: FilmStock,
        entryTitle: String = "",
        imageName: String = "",
        location: [String] = [],
        timestamp: Date = Date(),
        isFavourite: Bool = false
    ) {
        self.id = id
        self.reel = reel
        self.filmStock = filmStock
        self.entryTitle = entryTitle
        self.imageName = imageName
        self.location = location
        self.timestamp = timestamp
        self.isFavourite = isFavourite
    }
}
