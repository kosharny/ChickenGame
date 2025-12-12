//
//  SelectionLevelView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI

struct SelectionLevelView: View {
    
    
    @ObservedObject var playerViewModel: PlayerViewModel
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
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
                            Button {
                                plaingGameViewModel.changeLevel(1)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 1)
                            }
                            
                            Button {
                                plaingGameViewModel.changeLevel(2)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 2)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 2 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 2 ? 0 : 1)
                            Button {
                                plaingGameViewModel.changeLevel(3)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 3)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 3 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 3 ? 0 : 1)
                        }
                        
                        GridRow {
                            Button {
                                plaingGameViewModel.changeLevel(4)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 4)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 4 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 4 ? 0 : 1)
                            
                            Button {
                                plaingGameViewModel.changeLevel(5)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 5)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 5 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 5 ? 0 : 1)
                            
                            Button {
                                plaingGameViewModel.changeLevel(6)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 6)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 6 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 6 ? 0 : 1)
                        }
                        
                        GridRow {
                            Button {
                                plaingGameViewModel.changeLevel(7)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 7)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 7 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 7 ? 0 : 1)
                            
                            Button {
                                plaingGameViewModel.changeLevel(8)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 8)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 8 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 8 ? 0 : 1)
                            
                            Button {
                                plaingGameViewModel.changeLevel(9)
                                path.append(Route.game)
                            } label: {
                                levaelView(lavel: 9)
                            }
                            .disabled(plaingGameViewModel.playerVM.player.level >= 9 ? false : true)
                            .grayscale(plaingGameViewModel.playerVM.player.level >= 9 ? 0 : 1)
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    private func levaelView(lavel: Int) -> some View {
        var body: some View {
            ZStack {
                Image("lavelBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                Text("\(lavel)")
                    .foregroundStyle(.white )
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
        }
        
        return body
    }
}

#Preview {
    AppNavigation()
}
