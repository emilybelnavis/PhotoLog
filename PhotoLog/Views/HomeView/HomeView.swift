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
            ScrollView {
                
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: HomeView()) { Label("Home", systemImage: "house").foregroundStyle(Color.secondary) }
                    Spacer()
                    NavigationLink(destination: SettingsView()) { Label("Settings", systemImage: "gear") }
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
