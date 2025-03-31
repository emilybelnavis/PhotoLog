//
//  Photo.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftUI
import SwiftData
import CoreLocation


///
/// Data Model for Photos
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

import SwiftUI
import SwiftData
import PhotosUI
import CoreLocation
import CoreTransferable

@Model
final class Photo: ObservableObject {
    var id: String = ""
    var entryTitle: String = ""
    var comments: String = ""
    var photoDatestamp: Date = Date()
    var dateAdded: Date = Date()
    var refPhoto: Data = Data()
    var scannedPhoto: Data = Data()

    var location: PhotoLocation?

    // Flags
    var isDeveloped: Bool = false
    var isScanned: Bool = false
    var isFavourite: Bool = false

    var reel: Reel?
    
    init(
        entryTitle: String,
        comments: String,
        photoDatestamp: Date,
        refPhoto: Data,
        scannedPhoto: Data,
        location: PhotoLocation?,
        isDeveloped: Bool,
        isScanned: Bool,
        isFavourite: Bool,
        reel: Reel?
    ) {
        self.id = UUID().uuidString
        self.entryTitle = entryTitle
        self.comments = comments
        self.photoDatestamp = photoDatestamp
        self.dateAdded = dateAdded
        self.refPhoto = refPhoto
        self.scannedPhoto = scannedPhoto
        self.location = location
        self.isDeveloped = isDeveloped
        self.isScanned = isScanned
        self.isFavourite = isFavourite
        
        self.reel = reel
    }
}
