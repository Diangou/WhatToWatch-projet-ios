//
//  FilmDrameViewModel.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 06/11/2025.
//

import Foundation

@MainActor
final class FilmDrameViewModel: ObservableObject {
    @Published var allFilms: [Film] = []
    @Published var filteredFilms: [Film] = []
    @Published var selectedCategory: String = "Drame"
    
    init() {
        loadFilms()
        filterFilmsByCategory()
    }
    
    private func loadFilms() {
        self.allFilms = FilmRepository.shared.loadFilms()
    }
    
    private func filterFilmsByCategory() {
        self.filteredFilms = allFilms.filter {
            $0.categories.lowercased() == selectedCategory.lowercased()
        }
    }
}
