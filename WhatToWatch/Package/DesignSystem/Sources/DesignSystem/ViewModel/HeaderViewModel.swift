//
//  HeaderViewModel.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 06/11/2025.
//

import Foundation
import SwiftUI

@MainActor
public final class HeaderViewModel: ObservableObject {
    @Published public var searchText: String = ""
    
    public init() {}
    
    public func onSearch(_ text: String) {
        searchText = text
        print("Recherche en cours pour : \(text)")
    }
}
