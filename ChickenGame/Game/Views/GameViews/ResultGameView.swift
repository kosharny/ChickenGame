//
//  ResultGameView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct ResultGameView: View {
    
    
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @Binding var path: NavigationPath
    
    
    let titleText: String
    let isFinish: Bool
    let isLose: Bool
    let imageName: String
    
    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height
            let width = geo.size.width
            ZStack {
                GameBackgroundView()
                VStack {
                    Spacer()
                    Text(titleText)
                        .foregroundStyle(.white )
                        .font(.system(size: 80))
                        .fontWeight(.black)
                    if isFinish {
                        ScoreView(titleText: "SCORE", scoreCount: !isLose ? playerViewModel.player.scores.last ?? 0000 : 0000)
                            .frame(width: width * 0.85, height: height * 0.07)
                        ScoreView(titleText: "BEST", scoreCount: playerViewModel.player.scores.max() ?? 0000)
                            .frame(width: width * 0.85, height: height * 0.07)
                    }
                    HStack {
                        Button {
                            if playerViewModel.player.settings.vibrationEnabled == true {
                                HapticManager.instance.impact(style: .light)
                            }
                            plaingGameViewModel.stopGame()
                            path.append(Route.menu)
                        } label: {
                            Text("HOME")
                                .underline()
                                .foregroundStyle(.white )
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .padding(.top, 40)
                        }
                        if !isLose {
                            Spacer()
                            Button {
                                if playerViewModel.player.settings.vibrationEnabled == true {
                                    HapticManager.instance.impact(style: .light)
                                }
                                plaingGameViewModel.resetGame()
                                plaingGameViewModel.coinsGame = 0
                                path.append(Route.game)
                            } label: {
                                Text("RESTART")
                                    .underline()
                                    .foregroundStyle(.white )
                                    .font(.largeTitle)
                                    .fontWeight(.black)
                                    .padding(.top, 40)
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                    Button {
                        if playerViewModel.player.settings.vibrationEnabled == true {
                            HapticManager.instance.impact(style: .light)
                        }
                        if isLose {
                            plaingGameViewModel.resetGame()
                            path.append(Route.game)
                        } else if !isFinish {
                            plaingGameViewModel.resumeGame()
                            path.removeLast()
                        } else {
                            path.append(Route.play)
                        }
                    } label: {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.6)
                            .padding(height * 0.1)
                    }
                }
                .ignoresSafeArea()
                .frame(width: width)
                .background(Color.black.opacity(0.5))
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    
}

struct ScoreView: View {
    
    let titleText: String
    let scoreCount: Int
    
    var body: some View {
        HStack {
            Text(titleText)
                .foregroundStyle(.white )
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            Text("\(scoreCount)")
                .foregroundStyle(.white )
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.green)
        }
        
    }
}

