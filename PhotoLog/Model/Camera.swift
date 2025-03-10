//
//  Camera.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-09.
//

import Foundation
import SwiftData

@Model
final class Camera {
    enum CodingKeys: CodingKey {
        case id
        case brand
        case modelName
        case minIso
        case maxIso
        case format
        case type
        case lensMount
        case assetId
    }
    
    @Attribute(.unique) var id: String
    var brand: String
    var modelName: String
    var minIso: Int
    var maxIso: Int
    var format: String
    var type: String
    var lensMount: String
    var assetId: String

    init(
        id: String = "",
        brand: String = "",
        modelName: String = "",
        minIso: Int = 0,
        maxIso: Int = 0,
        format: String = "",
        type: String = "",
        lensMount: String = "",
        assetId: String = ""
    ) {
        self.id = id
        self.brand = brand
        self.modelName = modelName
        self.minIso = minIso
        self.maxIso = maxIso
        self.format = format
        self.type = type
        self.lensMount = lensMount
        self.assetId = assetId
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.modelName = try container.decode(String.self, forKey: .modelName)
        self.minIso = try container.decode(Int.self, forKey: .minIso)
        self.maxIso = try container.decode(Int.self, forKey: .maxIso)
        self.format = try container.decode(String.self, forKey: .format)
        self.type = try container.decode(String.self, forKey: .type)
        self.lensMount = try container.decode(String.self, forKey: .lensMount)
        self.assetId = try container.decode(String.self, forKey: .assetId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(brand, forKey: .brand)
        try container.encode(modelName, forKey: .modelName)
        try container.encode(minIso, forKey: .minIso)
        try container.encode(maxIso, forKey: .maxIso)
        try container.encode(format, forKey: .format)
        try container.encode(type, forKey: .type)
        try container.encode(lensMount, forKey: .lensMount)
        try container.encode(assetId, forKey: .assetId)
    }
}
