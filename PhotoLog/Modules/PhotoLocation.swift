//
//  PhotoLocation.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-20.
//

import Foundation

struct PhotoLocation: Codable {
    enum CodingKeys: CodingKey {
        case locationName
        case coordinates
        case streetAddress
        case city
        case state
        case country
        case postcode
    }
    
    var locationName: String?
    var coordinates: [Double]?
    var streetAddress: String?
    var city: String?
    var state: String?
    var country: String?
    var postcode: String?
    
    init(
        locationName: String? = "",
        coordinates: [Double]? = [0.0, 0.0],
        streetAddress: String? = "",
        city: String? = "",
        state: String? = "" ,
        country: String? = "",
        postcode: String? = ""
    ) {
        self.locationName = locationName
        self.coordinates = coordinates
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.country = country
        self.postcode = postcode
    }
}
