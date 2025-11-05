//
//  FilmModel.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI
import Foundation


struct Film: Identifiable, Codable {
    let id: Int
    let titre: String
    let annee: Int
    let realisateur: String
    let categories: String
    let duree: Int
    let note: Double
    let description: String
    let afficheURL: String
    let coverURL: String
}

struct FilmList: Codable {
    let films: [Film]
}



