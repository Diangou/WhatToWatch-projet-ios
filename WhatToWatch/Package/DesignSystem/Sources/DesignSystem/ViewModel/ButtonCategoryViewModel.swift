//
//  ButtonCategoryViewModel.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 06/11/2025.
//

import Foundation
import SwiftUI

@MainActor
public final class ButtonCategoryViewModel: ObservableObject {
    public let title: String
    public let destination: AnyView
    
    public init(title: String, destination: AnyView) {
        self.title = title
        self.destination = destination
    }
}
