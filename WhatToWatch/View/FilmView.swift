
//
//  FilmView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//
//
//  FilmView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//

//
//  FilmView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 05/11/2025.
//
import SwiftUI
import DesignSystem

struct FilmView: View {
    @StateObject private var viewModel = FilmViewModel()
    
    @StateObject private var categoryButtonsListViewModel = ButtonCategoryListViewModel(categories: [
        ButtonCategoryViewModel(
            title: "Drame",
            destination: AnyView(FilmDrameView())
        ),
        ButtonCategoryViewModel(
            title: "Action",
            destination: AnyView(FilmActionView())
        ),
        ButtonCategoryViewModel(
            title: "Comédie",
            destination: AnyView(FilmComedieView())
        )
    ])
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color.black, Color.red.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Nos Catégories")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        ButtonCategoryListView(viewModel: categoryButtonsListViewModel)
                        
                        ForEach(viewModel.categories, id: \.self) { category in
                            VStack(alignment: .leading, spacing: 12) {
                                Text(category)
                                    .font(.largeTitle.bold())
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                
                                let filmsInCategory = viewModel.films.filter {
                                    $0.categories.lowercased() == category.lowercased()
                                }
                                
                                FilmListView(films: filmsInCategory)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    FilmView()
}
