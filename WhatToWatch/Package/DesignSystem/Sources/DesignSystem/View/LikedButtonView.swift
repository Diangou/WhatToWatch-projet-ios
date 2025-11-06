//
//  LikedButtonView.swift
//  DesignSystem
//
//  Created by KOKONYANGE-NKASEI Laura on 06/11/2025.
//

import SwiftUI
import PhotosUI

public struct LikedButtonView: View {
    public var isLiked: Bool
    public var action: () -> Void
    
    public init(isLiked: Bool, action: @escaping () -> Void) {
        self.isLiked = isLiked
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .font(.title2)
        }
    }
}
