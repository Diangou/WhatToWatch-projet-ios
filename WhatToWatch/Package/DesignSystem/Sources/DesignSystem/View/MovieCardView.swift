//
//  MovieCardView.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI

public struct MovieCardView: View {
    @ObservedObject public var viewModel: MovieCardViewModel

    public init(viewModel: MovieCardViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 10) {
            AsyncImage(url: URL(string: viewModel.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 150, height: 220)
            .cornerRadius(12)
            .clipped()
            .shadow(radius: 10)

            Text(viewModel.formattedTitle)
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
                .shadow(radius: 10)
        }
        .frame(width: 160)
    }
}

#Preview {
    MovieCardView(
        viewModel: MovieCardViewModel(
            title: "Mad Max: Fury Road",
            imageURL: "https://image.tmdb.org/t/p/w500/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg"
        )
    )
}
