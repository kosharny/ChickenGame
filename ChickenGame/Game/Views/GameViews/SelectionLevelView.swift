//
//  SelectionLevelView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI

struct SelectionLevelView: View {
    
    
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            ZStack {
                BackgraundView()
                VStack {
                    HStack {
                        Button {
                            HapticManager.instance.impact(style: .light)
                            path.removeLast()
                        } label: {
                            Image("backButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.2)
                        }
                        
                        Spacer()
                        Button {
                            if playerViewModel.player.settings.vibrationEnabled == true {
                                HapticManager.instance.impact(style: .light)
                            }
                            path.append(Route.shop)
                        } label: {
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
                                    .padding(.trailing, -(width * 0.2))
                                Text("\(playerViewModel.player.coins)")
                                    .foregroundStyle(.white )
                                    .font(.caption)
                                    .fontWeight(.black)
                                    .padding(.trailing, width * 0.14)
                            }
                            .padding(.trailing, width * 0.3)
                        }
                    }
                    .padding(.horizontal)
                    Text("CHANGE LAVEL")
                        .foregroundStyle(.white )
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(40)
                    Spacer()
                    
                    Grid(alignment: .leading, horizontalSpacing: 20) {
                        GridRow {
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 1)
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 2)
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 3)
                        }
                        
                        GridRow {
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 4)
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 5)
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 6)
                        }
                        
                        GridRow {
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 7)
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 8)
                            levelButton(plaingGameViewModel: plaingGameViewModel, path: $path, level: 9)
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct levelButton: View {
    
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @Binding var path: NavigationPath
    
    var level: Int
    
    var body: some View {
        Button {
            if playerViewModel.player.settings.vibrationEnabled == true {
                HapticManager.instance.impact(style: .light)
            }
            plaingGameViewModel.changeLevel(level)
            path.append(Route.game)
        } label: {
            ZStack {
                Image("lavelBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                Text("\(level)")
                    .foregroundStyle(.white )
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
        }
        .disabled(playerViewModel.player.level >= level ? false : true)
        .grayscale(playerViewModel.player.level >= level ? 0 : 1)
    }
}

