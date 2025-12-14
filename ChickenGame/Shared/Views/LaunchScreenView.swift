//
//  LaunchScreenView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI
import Combine

struct LaunchScreenView: View {
    
    @State private var progress: CGFloat = 0.0
    @State private var displayedProgress = 0
    @State private var scale: CGFloat = 1.0
    
    let timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            BackgraundView()
            Image("chickenMain")
                .resizable()
                .scaledToFit()
                .padding(.bottom, -200)
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                        scale = 1.02
                    }
                }
            
            VStack {
                Spacer()
                ZStack {
                    Image("launchFrame")
                        .resizable()
                        .scaledToFit()
                    Image("launchFill")
                        .resizable()
                        .scaledToFit()
                        .mask(
                            GeometryReader { geo in
                                Rectangle()
                                    .frame(width: geo.size.width * progress)
                            }
                        )
                    Text("\(displayedProgress)%")
                        .foregroundStyle(.white )
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .padding(20)
                .onAppear {
                    withAnimation(.linear(duration: 3)) {
                        progress = 1
                    }
                }
                .onReceive(timer) { _ in
                    if displayedProgress < Int(progress * 100) {
                        displayedProgress += 1
                    }
                }
            }
            .padding(.bottom, 40)
        }
    }
    
//    private func startLoading() {
//        withAnimation(.linear(duration: 3.0)) {
//            progress = 1
//        }
//    }
}

#Preview {
    LaunchScreenView()
}
