//
//  MovieCardViewModel.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 05/11/2025.
//

import Foundation
import SwiftUI

public final class MovieCardViewModel: ObservableObject {
    @Published public var title: String
    @Published public var imageURL: String

    public init(title: String, imageURL: String) {
        self.title = title
        self.imageURL = imageURL
    }

    public var formattedTitle: String {
        title.uppercased()
    }
}

