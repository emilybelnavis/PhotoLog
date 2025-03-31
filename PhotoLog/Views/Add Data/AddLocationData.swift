//
//  AddLocationData.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-20.
//

import SwiftUI
import MapItemPicker
import CoreLocation

struct AddLocationData: View {
    @State var location: PhotoLocation?
    var body: some View {
        NavigationView {
            MapItemPicker(
                primaryMapItemAction: .init (
                    title: "Select Location",
                    imageName: "checkmark.circle.fill",
                    handler: { mapItem in
//                        $location.locationName = mapItem.name
                        if var location = location {
                            location.coordinates = [mapItem.location.latitude, mapItem.location.longitude]
                            self.location = location
                        }
                        return true
                    }
                )
            )
        }
    }
}
