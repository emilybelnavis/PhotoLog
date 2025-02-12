//
//  SwiftData+UniqueValues.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-11.
//

extension Sequence where Iterator.Element: Hashable {
    func uniqueValues() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted}
    }
}
