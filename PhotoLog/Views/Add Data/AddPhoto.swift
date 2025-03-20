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
    @State var location: CLLocation?
    @State var locationData: Data?
    
    @State private var showError: Bool = false
    
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
                    NavigationLink {

                    } label: {
                        Label("Add a location to this photo", systemImage: "location.fill")
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
        }
    }
}
