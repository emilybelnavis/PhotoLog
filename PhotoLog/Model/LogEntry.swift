//
//  LogEntry.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftUI
import SwiftData
import CoreLocation


///
/// Data Model for LogEntries
///
/// - Parameters:
///     - id: The id for the entry
///     - reel: The reel that's attached to the log entry
///     - filmStock: The Film Stock that's being used for this photo
///     - entryTitle: The name for the photo
///     - comments: Any comments for this entry
///     - timestamp: The date/time the entry was created
///     - isDeveloped: Boolean value for whether this image was developed or not
///     - isScanned: Boolean value for whether this image has been scanned or not
///     - isFavourite: Boolean value for whether this image has been favourited or not
@Model
final class LogEntry {
    var id: String
    var entryTitle: String
    var comments: String
    var photoDatestamp: Date
    var dateAdded: Date
    var refPhoto: Data?
    var scannedPhoto: Data?

    // Location Data
    var city: String?
    var state: String?
    var country: String?
    var location: Data?

    // Flags
    var isDeveloped: Bool
    var isScanned: Bool
    var isFavourite: Bool

    var reel: Reel
    
    init(
        entryTitle: String,
        comments: String,
        photoDatestamp: Date,
        refPhoto: Data?,
        scannedPhoto: Data?,
        city: String?,
        state: String?,
        country: String?,
        location: Data?,
        isDeveloped: Bool,
        isScanned: Bool,
        isFavourite: Bool,
        reel: Reel
    ) {
        self.id = UUID().uuidString
        self.entryTitle = entryTitle
        self.comments = comments
        self.photoDatestamp = photoDatestamp
        self.dateAdded = Date()
        
        self.refPhoto = refPhoto
        self.scannedPhoto = scannedPhoto
        
        self.city = city
        self.state = state
        self.country = country
        self.location = location
        
        self.isDeveloped = isDeveloped
        self.isScanned = isScanned
        self.isFavourite = isFavourite
        
        self.reel = reel
    }
}
