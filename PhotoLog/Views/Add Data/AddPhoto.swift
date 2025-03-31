//
//  AddPhoto.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-20.
//

import CoreLocation
import CoreLocationUI
import PhotosUI
import SwiftUI
import SwiftData
import MapItemPicker

struct AddPhoto: View {
    @Environment(\.dismiss) var dismiss: DismissAction
    @Environment(\.modelContext) var modelContext: ModelContext
    
    @State var reel: Reel?
    @State var entryTitle: String = ""
    @State var comments: String = ""
    @State var photoDatestamp: Date?
    @State var referencePhoto: Data?
    @State var referencePhotoItem: PhotosPickerItem?
    @State var scannedPhoto: Data?
    @State var scannedPhotoItem: PhotosPickerItem?
    @State var isDeveloped: Bool = false
    @State var isScanned: Bool = false
    @State var isFavourite: Bool = false
    @State var location: PhotoLocation?

    @State private var showError: Bool = false
    @State private var showMapPicker: Bool = false

    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Photo Title", text: $entryTitle)
                TextField("Comments", text: $comments)
                VStack {
                    if referencePhoto != nil {
                        Image(uiImage: UIImage(data: referencePhoto!)!)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding()
                    }
                    PhotosPicker("Select a reference image", selection: $referencePhotoItem, matching: .images)
                }
                VStack {
                    if scannedPhoto != nil {
                        Image(uiImage: UIImage(data: scannedPhoto!)!)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding()
                    }
                    PhotosPicker("Select the scanned film image", selection: $scannedPhotoItem, matching: .images)
                }
                VStack(alignment: .center) {
                    Button(action: {
                        locationManager.requestAuthorization()
                        locationManager.requestLocation()
                        showMapPicker.toggle()
                    }) {
                        Label("Add a location to this photo", systemImage: "location")
                    }
                }
            }
            .onChange(of: referencePhotoItem) {
                Task {
                    if let loaded = try? await referencePhotoItem?.loadTransferable(type: Data.self) {
                        referencePhoto = loaded
                    } else {
                        print("Failed to get image")
                    }
                }
            }
            .onChange(of: scannedPhotoItem) {
                Task {
                    if let loaded = try? await scannedPhotoItem?.loadTransferable(type: Data.self) {
                        scannedPhoto = loaded
                    } else {
                        print("Failed to get image")
                    }
                }
            }
            .mapItemPickerSheet(isPresented: $showMapPicker) { mapItem in
                print(mapItem)
                if var location = location {
                    location.locationName = mapItem.name
                    location.coordinates = [mapItem.location.latitude, mapItem.location.longitude]
                    location.streetAddress = mapItem.street
                    location.city = mapItem.city
                    location.state = mapItem.state
                    location.country = mapItem.country
                    location.postcode = mapItem.postcode
                }
            }
        }
    }
}
