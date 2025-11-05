//
//  FilmDetailView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI

struct FilmDetailView: View {
    let film: Film
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: film.afficheURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(height: 300)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(film.titre)
                        .font(.largeTitle)
                        .bold()
                 
                    HStack {
                        Text(String(film.note))
                        Text(String(film.duree))
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    
                    
                    Divider()
                    
                    Text(film.description)
                        .font(.body)
                }
                .padding()
            }
        }
        .navigationTitle(film.titre)
    }
}

#Preview {
    FilmDetailView(film: FilmRepository.shared.loadFilms().first!)
}
