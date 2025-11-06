//
//  ButtonCategoryListViewModel.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 06/11/2025.
//

import Foundation
import SwiftUI

@MainActor
public final class ButtonCategoryListViewModel: ObservableObject {
    @Published public var categories: [ButtonCategoryViewModel]

    public init(categories: [ButtonCategoryViewModel] = []) {
        self.categories = categories
    }
}


