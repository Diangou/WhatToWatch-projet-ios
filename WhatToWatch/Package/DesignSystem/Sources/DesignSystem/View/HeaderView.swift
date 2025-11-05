//
//  HeaderView.swift
//  DesignSystem
//
//  Created by CAMARA Diangou on 05/11/2025.
//


import SwiftUI
import PhotosUI


public struct HeaderView: View {
    public init (){}
    public var body: some View {
        HStack (spacing: 25){
            HStack{
                Text("WHAT 2 WATCH")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.white)
            }
            HStack{
                Image("logo-cinema")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            }
        }
    }
}
#Preview {
    HeaderView()
}

