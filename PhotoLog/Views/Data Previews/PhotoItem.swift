//
//  PhotoItem.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-20.
//

import SwiftUI
import SwiftData

struct PhotoItem: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    var photo: Photo
    
    var body: some View {
        NavigationLink {
            PhotoDetailView(photo: photo)
        } label: {
            VStack {
                
            }
        }
    }
}
