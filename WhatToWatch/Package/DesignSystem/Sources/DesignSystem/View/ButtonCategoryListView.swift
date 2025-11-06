//
//  ButtonCategoryListView.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 06/11/2025.
//



import SwiftUI

public struct ButtonCategoryListView: View {
    @ObservedObject public var viewModel: ButtonCategoryListViewModel

    public init(viewModel: ButtonCategoryListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(viewModel.categories, id: \.title) { category in
                    ButtonCategoryView(viewModel: category)
                        .fixedSize()
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 10)
    }
}


