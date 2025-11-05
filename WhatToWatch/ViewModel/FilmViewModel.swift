//
//  FilmViewModel.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import Foundation

@MainActor
final class FilmViewModel: ObservableObject {
    @Published var films: [Film] = []

    init() {
        loadFilms()
    }

    private func loadFilms() {
        self.films = FilmRepository.shared.loadFilms()
    }

    var categories: [String] {
        let all = Set(films.map { $0.categories })
        return Array(all).sorted()
    }

    func films(for category: String) -> [Film] {
        films.filter { $0.categories.lowercased() == category.lowercased() }
    }
}

