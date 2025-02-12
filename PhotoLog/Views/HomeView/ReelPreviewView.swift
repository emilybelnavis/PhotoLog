//
//  ReelView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-12.
//

import Foundation
import SwiftUI
import SwiftData

struct ReelPreviewView: View {
    static var fetchDescriptor: FetchDescriptor<Reel> {
        var descriptor = FetchDescriptor<Reel>()
        descriptor.fetchLimit = 3
        return descriptor
    }
    
    @Query(ReelPreviewView.fetchDescriptor) private var reels: [Reel]
    @State private var showAddEntry = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Reels").font(.system(size: 32, weight: .bold))
                Spacer()
                Button(action: { showAddEntry.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            Spacer()
            List(reels) { reel in
                ReelItem(reel: reel)
            }
        }
        .sheet(isPresented: $showAddEntry, content: {
            NavigationStack {
                AddReel()
            }
            .presentationDetents([.medium])
        })
    }
}

struct ReelPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReelPreviewView()
    }
}
