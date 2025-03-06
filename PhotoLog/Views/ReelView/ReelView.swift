//
//  ReelView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-12.
//

import SwiftUI
import SwiftData

struct ReelView: View {
    @Query var reels: [Reel]
    var body: some View {
        List {
            ForEach(reels) { reel in
                ReelItem(reel: reel)
            }
        }
    }
}
