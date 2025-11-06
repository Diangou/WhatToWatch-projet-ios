//
//  ButtonCategoryView.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 06/11/2025.
//


import SwiftUI

public struct ButtonCategoryView: View {
    @ObservedObject public var viewModel: ButtonCategoryViewModel
    @State private var navigate = false

    public init(viewModel: ButtonCategoryViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationLink(isActive: $navigate) {
            viewModel.destination 
        } label: {
            Text(viewModel.title.uppercased())
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 25)
                .background(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 3)
                )
                .cornerRadius(25)
                .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
        .onTapGesture {
            navigate = true
        }
    }
}



