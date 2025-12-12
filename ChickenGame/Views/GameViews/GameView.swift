//
//  GameView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

enum GameState {
    case ready
    case playing
    case paused
    case won
    case lost
}

struct GameView: View {
    
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
    @Binding var path: NavigationPath
    
    private let eggSize: CGFloat = 64
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            Color.clear
                .onAppear {
                    plaingGameViewModel.gameFieldSize = geo.size
                }
                .onChange(of: geo.size) { _, newValue in
                    plaingGameViewModel.gameFieldSize = newValue
                }
            ZStack {
                GameBackgroundView()
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Image("coinBg")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.25)
                                .padding(.trailing)
                            Image("coin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.12)
                                .padding(.trailing, -40)
                            Text("\(plaingGameViewModel.coinsGame)")
                                .foregroundStyle(.white )
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(.trailing, width * 0.14)
                        }
                        .padding(.trailing, 30)
                        Button {
                            plaingGameViewModel.state = .paused
                            plaingGameViewModel.pauseGame()
                            path.append(Route.pauseGame)
                        } label: {
                            Image("pouseButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.2)
                        }
                        
                    }
                    .padding(.trailing)
                    Spacer()
                    ForEach(plaingGameViewModel.eggs) { egg in
                        EggView()
                            .frame(width: eggSize, height: eggSize)
                            .position(x: egg.x * geo.size.width, y: egg.y * geo.size.height)
                            .onTapGesture {
                                plaingGameViewModel.tapEgg(egg)
                            }
                            .transition(.scale)
                            .animation(.easeInOut, value: plaingGameViewModel.eggs)
                    }
                    HStack(spacing: 10) {
                        ForEach(0..<3) { idx in
                            Image("heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .opacity(idx < plaingGameViewModel.lives ? 1 : 0.25)
                        }
                    }
                    .padding(.vertical, 12)
                }
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                plaingGameViewModel.startGame()
            }
            .onChange(of: plaingGameViewModel.state) { _, newValue in
                if newValue == .won {
                    path.append(Route.winGame)
                } else if newValue == .lost {
                    path.append(Route.loseGame)
                }
            }
        }
    }
}

struct EggView: View {
    var body: some View {
        Image("egg")
            .resizable()
            .scaledToFit()
            .shadow(radius: 3)
    }
}

#Preview {
    AppNavigation()
}
