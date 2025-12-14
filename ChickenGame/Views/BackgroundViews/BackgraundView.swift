//
//  BackgraundView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct BackgraundView: View {
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0
    @State private var offsetX: CGFloat = -100
    @State private var offsetY: CGFloat = -400
    @State private var offsetXtwoStars: CGFloat = 100
    @State private var offsetYtwoStars: CGFloat = 400
    
    var body: some View {
        ZStack {
            Image("bgMenu")
                .resizable()
            Image("stars")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .offset(x: offsetX, y: offsetY)
                .rotationEffect(.degrees(rotation))
            Image("stars")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .offset(x: offsetXtwoStars, y: offsetYtwoStars)
                .rotationEffect(.degrees(rotation))
            
        }
        .ignoresSafeArea()
        .scaleEffect(scale)
        .onAppear {
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: true)) {
                scale = 1.05
            }
            withAnimation(.easeInOut(duration: 15).repeatForever(autoreverses: true)) {
                offsetX = 300
                offsetXtwoStars = -300
            }
            withAnimation(.easeInOut(duration: 15).repeatForever(autoreverses: true)) {
                offsetY = 600
                offsetYtwoStars = -600
            }
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: true)) {
                rotation = 360
            }
        }
    }
}

#Preview {
    BackgraundView()
}
