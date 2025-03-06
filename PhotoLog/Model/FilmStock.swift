//
//  FilmStock.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftData

@Model
final class FilmStock: Codable {
    enum CodingKeys: CodingKey {
        case id
        case brand
        case stockName
        case speed
        case exposureCount
        case type
        case format
        case assetId
    }
    
    var id: String
    var brand: String
    var stockName: String
    var speed: Int
    var exposureCount: Int
    var type: String
    var format: String
    var assetId: String
    
    init(
        id: String = UUID().uuidString,
        brand: String,
        stockName: String,
        speed: Int,
        exposureCount: Int,
        type: String,
        format: String,
        assetId: String
    ) {
        self.id = id
        self.brand = brand
        self.stockName = stockName
        self.speed = speed
        self.exposureCount = exposureCount
        self.type = type
        self.format = format
        self.assetId = assetId
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.stockName = try container.decode(String.self, forKey: .stockName)
        self.speed = try container.decode(Int.self, forKey: .speed)
        self.exposureCount = try container.decode(Int.self, forKey: .exposureCount)
        self.type = try container.decode(String.self, forKey: .type)
        self.format = try container.decode(String.self, forKey: .format)
        self.assetId = try container.decode(String.self, forKey: .assetId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.stockName, forKey: .stockName)
        try container.encode(self.speed, forKey: .speed)
        try container.encode(self.exposureCount, forKey: .speed)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.format, forKey: .format)
        try container.encode(self.assetId, forKey: .assetId)
    }
}
