//
//  FilmRepository.swift
//  WhatToWatch
//
//  Created by KOKONYANGE-NKASEI Laura on 05/11/2025.
//

import Foundation

public class FilmRepository {
    public static let shared = FilmRepository()
    
    private init() {}
    
    public func loadFilms() -> [Film] {
        guard let url = Bundle.main.url(forResource: "Films", withExtension: "json") else {
            print("❌ Fichier films.json introuvable")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let filmList = try JSONDecoder().decode(FilmList.self, from: data)
            return filmList.films
        } catch {
            print("❌ Erreur de décodage JSON : \(error)")
            return []
        }
    }
}
