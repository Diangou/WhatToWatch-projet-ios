//
//  FilmView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI

struct FilmView: View {
    let films = FilmRepository.shared.loadFilms()
    
    var body: some View {
        NavigationView {
            List(films) { film in
                NavigationLink(destination: FilmDetailView(film: film)) {
                    HStack {
                        AsyncImage(url: URL(string: film.afficheURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 70, height: 100)
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text(film.titre)
                                .font(.headline)
                                .foregroundStyle(.black)
                            Text("\(film.annee) • \(film.realisateur)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("🎞️ Films")
        }
    }
}


#Preview {
    FilmView()
}
