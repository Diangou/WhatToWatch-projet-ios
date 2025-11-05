//
//  FilmModel.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI
import Foundation


public struct Film: Identifiable, Codable {
    public let id: Int
    public let titre: String
    public let annee: Int
    public let realisateur: String
    public let categories: String
    public let duree: Int
    public let note: Double
    public let description: String
    public let afficheURL: String
}

public struct FilmList: Codable {
    public let films: [Film]
}
