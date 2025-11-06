//
//  FilmListView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//


import SwiftUI
import DesignSystem

struct FilmListView: View {
    let films: [Film]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(films, id: \.titre) { film in
                    NavigationLink(destination: FilmDetailView(film: film)) {
                        MovieCardView(
                            viewModel: MovieCardViewModel(
                                title: film.titre,
                                imageURL: film.afficheURL
                            )
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 260)
    }
}
