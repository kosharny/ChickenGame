//
//  MainMenuView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI



struct MainMenuView: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    @Binding var path: NavigationPath
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height
            let width = geo.size.width
            ZStack{
                BackgraundView()
                Image("chickenMain")
                    .resizable()
                    .scaledToFit()
                    .frame(height: height * 0.7)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                            scale = 1.02
                        }
                    }
                
                VStack{
                    HStack {
                        Button {
                            if playerViewModel.player.settings.vibrationEnabled == true {
                                HapticManager.instance.impact(style: .light)
                            }
                            path.append(Route.settings)
                        } label: {
                            Image("menuButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.2)
                        }
                        Spacer()
                        Button {
                            if playerViewModel.player.settings.vibrationEnabled == true {
                                HapticManager.instance.impact(style: .light)
                            }
                            path.append(Route.howToPlay)
                        } label: {
                            Image("infoButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.2)
                                .padding(.trailing)
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                    Button {
                        if playerViewModel.player.settings.vibrationEnabled == true {
                            HapticManager.instance.impact(style: .light)
                        }
                        path.append(Route.play)
                    } label: {
                        Image("playButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.6)
                            .padding(height * 0.1)
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            if playerViewModel.player.settings.soundEnabled == true {
                SoundManager.instance.playSound(soundName: "bg")
            }
        }
    }
}

