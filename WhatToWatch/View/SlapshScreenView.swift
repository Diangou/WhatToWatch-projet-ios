//
//  SlapshScreenView.swift
//  WhatToWatch
//
//  Created by CAMARA Diangou on 06/11/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 0.0
    @State private var scale: CGFloat = 0.8

    var body: some View {
        if isActive {
            FilmView()
        } else {
            ZStack {
                LinearGradient(
                    colors: [Color.black, Color.red.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "film.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .scaleEffect(scale)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                opacity = 1.0
                                scale = 1.0
                            }
                        }

                    Text("WhatToWatch")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .opacity(opacity)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
