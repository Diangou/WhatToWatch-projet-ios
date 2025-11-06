//
//  HeaderView.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import SwiftUI

public struct HeaderView: View {
    @ObservedObject var viewModel: HeaderViewModel
    
    public init(viewModel: HeaderViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "film.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
            
            Text("WhatToWatch")
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Spacer()
            
           
        }
        .padding(.horizontal)
        .padding(.top, 10)
       
    }
}

#Preview {
    HeaderView(viewModel: HeaderViewModel())
}
