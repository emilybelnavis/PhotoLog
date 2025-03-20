//
//  PhotoGalleryPreviewView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-11.
//

import SwiftUI
import SwiftData

struct PhotoGalleryPreviewView: View {
    static var fetchDescriptor: FetchDescriptor<Photo> {
        var descriptor = FetchDescriptor<Photo>(sortBy: [SortDescriptor(\.dateAdded, order: .forward)])
        descriptor.fetchLimit = 4
        return descriptor
    }
    
    private let gridAdaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    
    @Query(fetchDescriptor) var photos: [Photo]
    
    @Environment(\.modelContext) var modelContext: ModelContext
    @State private var showAddPhoto: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Photos").font(.system(size: 32, weight: .bold))
                Spacer()
                Button(action: {showAddPhoto.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .padding(.horizontal, 20)
            Spacer()
            List {
                if photos.count != 0 {
                    LazyVGrid(columns: gridAdaptiveColumn, spacing: 20) {
                        ForEach(photos) { photo in
                            PhotoItem(photo: photo)
                        }
                    }
                } else {
                    HStack {
                        Text("No photos are saved to the library")
                    }
                }
            }
            .sheet(isPresented: $showAddPhoto, content: {
                NavigationStack {
                    AddPhoto()
                }
                .presentationDetents([.medium])
            })
        }
    }
}
