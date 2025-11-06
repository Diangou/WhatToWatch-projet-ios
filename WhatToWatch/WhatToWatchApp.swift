//
//  WhatToWatchApp.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI

@main
struct WhatToWatchApp: App {
    @StateObject var favorites = FavoritesFilms() 

    var body: some Scene {
        WindowGroup {
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
