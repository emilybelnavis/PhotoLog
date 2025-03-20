//
//  HomeView.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-08.
//

import Foundation
import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                VStack {
                    Spacer(minLength: 32)
                    HStack {
                        ReelPreviewView()
                    }
                    Spacer()
                    HStack {
                        PhotoGalleryPreviewView()
                    }
                }
                .navigationTitle("Home")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
