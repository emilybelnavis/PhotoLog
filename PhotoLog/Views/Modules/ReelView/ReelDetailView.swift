//
//  ReelDetailView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-06.
//

import SwiftUI
import SwiftData

struct ReelDetailView: View {
    @Environment(\.modelContext) var modelContext
    @State var reel: Reel
    
    var body: some View {
        VStack {
            Text("\(reel.id)").font(.title)
        }
    }
}
