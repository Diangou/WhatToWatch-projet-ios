//
//  FilmFavoritesView.swift
//  WhatToWatch
//
//  Created by KOKONYANGE-NKASEI Laura on 06/11/2025.
//

import SwiftUI

struct FilmsFavoritesView: View {
    @EnvironmentObject var favorites: FavoritesFilms
    private let repository = FilmRepository.shared
    
    var favoriteFilms: [Film] {
        repository.loadFilms().filter { favorites.films.contains($0.id) }
    }
    
    var body: some View {
        NavigationView {
            if favoriteFilms.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("Aucun film en favoris")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .navigationTitle("Mes Favoris ❤️")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                List(favoriteFilms, id: \.id) { film in
                    NavigationLink(destination: FilmDetailView(film: film)) {
                        HStack(spacing: 15) {
                            AsyncImage(url: URL(string: film.afficheURL)) { image in
                                image.resizable()
                                    .frame(width: 60, height: 90)
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(film.titre)
                                    .font(.headline)
                                Text(String(film.annee))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(film.realisateur)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .navigationTitle("Mes Favoris ❤️")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    FilmsFavoritesView()
        .environmentObject(FavoritesFilms())
}

