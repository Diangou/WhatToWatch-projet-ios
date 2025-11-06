//
//  FilmComedieView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 06/11/2025.
//


import SwiftUI
import DesignSystem

struct FilmComedieView: View {
    @StateObject private var viewModel = FilmComedieViewModel()
    
    var body: some View {
            ZStack {
                LinearGradient(
                    colors: [Color.black, Color.red.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(viewModel.selectedCategory)
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.top, 10)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(viewModel.filteredFilms, id: \.titre) { film in
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
                        .padding(.bottom, 30)
                    }
                }
            }
        }
    }


#Preview {
        FilmComedieView()
}
