//
//  FilmDetailView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI
import DesignSystem

class FavoritesFilms: ObservableObject {
    private let key = "FavoritesFilms"
    @Published private(set) var films: Set<Int>

    init() {
        if let saved = UserDefaults.standard.array(forKey: key) as? [Int] {
            films = Set(saved)
        } else {
            films = []
        }
    }

    func contains(_ film: Film) -> Bool {
        films.contains(film.id)
    }

    func add(_ film: Film) {
        films.insert(film.id)
        save()
        print("Film ajouté en favoris : \(film.titre) (\(film.annee)) par \(film.realisateur)")
        print("AStockés en favoris:", films)
    }

    func remove(_ film: Film) {
        films.remove(film.id)
        save()
        print("Film supprimé des favoris \(film.titre) (\(film.annee))")
        print("RStockés en favoris", films)
    }

    private func save() {
        UserDefaults.standard.set(Array(films), forKey: key)
        print("SStockés en favoris", films)
    }
    
}


struct FilmDetailView: View {
    
    @EnvironmentObject var favorites: FavoritesFilms
    let film: Film
    let backgroundGradient = LinearGradient(
        colors: [Color.red.opacity(0.9), Color.black],
        startPoint: .top,
        endPoint: .bottom)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                AsyncImage(url: URL(string: film.coverURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(Color.black.opacity(0.2))
                } placeholder: {
                    ProgressView()
                }
                //Section Infos Films + Poster
                VStack {
                    HStack () {
                        VStack (alignment: .leading) {
                            Text(film.titre)
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .bold()
                            Text(String(film.annee))
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text(film.realisateur)
                                .foregroundColor(.white)
                            Divider()
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                                Text(String(film.note))
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            HStack {
                                Image(systemName: "hourglass")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                                Text(String(film.duree))
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            HStack {
                                LikedButtonView(isLiked: favorites.contains(film)) {
                                    if favorites.contains(film) {
                                        favorites.remove(film)
                                    } else {
                                        favorites.add(film)
                                    }
                                }
                            }
                            .padding(.top ,10)
                        }
                        // Poster
                        ZStack {
                            AsyncImage(url: URL(string: film.afficheURL)) { image in
                                image
                                    .resizable()
                                    .frame(width: 150, height: 220)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(10)
                    Divider().background(Color.white)
                    
                }
                .padding(.horizontal, 35)
                
                HStack () {
                    Text(film.description)
                        .font(.body)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }.padding(.horizontal, 35)
            }
        }
        .ignoresSafeArea()
        .background(backgroundGradient)
    }
}

#Preview {
    FilmDetailView(film: FilmRepository.shared.loadFilms().first!)
        .environmentObject(FavoritesFilms()) // 👈 obligatoire
}
