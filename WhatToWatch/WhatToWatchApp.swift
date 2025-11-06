//
//  WhatToWatchApp.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI
import DesignSystem

@main
struct WhatToWatchApp: App {
    @StateObject var favorites = FavoritesFilms()
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView()
                    .background(Color.black.ignoresSafeArea())
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                TabView {
                    Tab("Home", systemImage: "house") {
                        FilmView()
                            .environmentObject(favorites)
                    }
                    Tab("Favorites", systemImage: "heart.fill") {
                        FilmsFavoritesView()
                            .environmentObject(favorites)
                    }
                }
            }
        }
    }
}
