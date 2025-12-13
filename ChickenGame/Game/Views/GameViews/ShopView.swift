//
//  ShopView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 12.12.2025.
//

import SwiftUI

struct ShopView: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            ZStack {
                BackgraundView()
                VStack {
                    HStack {
                        Button {
                            if playerViewModel.player.settings.vibrationEnabled == true {
                                HapticManager.instance.impact(style: .light)
                            }
                            path.removeLast()
                        } label: {
                            Image("backButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.2)
                        }
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
                                .padding(.trailing, -(width * 0.2))
                            Text("\(playerViewModel.player.coins)")
                                .foregroundStyle(.white )
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(.trailing, width * 0.14)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    Grid(alignment: .center, horizontalSpacing: 25) {
                        GridRow {
                            Text("SHOP")
                                .foregroundStyle(.white )
                                .font(.system(size: 50))
                                .fontWeight(.black)
                                .gridCellColumns(3)
                        }
                        GridRow {
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg10", costEgg: 10000)
                                .frame(width: width * 0.2)
                            
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg20", costEgg: 20000)
                                .frame(width: width * 0.2)
                            
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg30", costEgg: 30000)
                                .frame(width: width * 0.2)
                        }
                        GridRow {
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg50", costEgg: 50000)
                                .frame(width: width * 0.2)
                            
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg100", costEgg: 100000)
                                .frame(width: width * 0.2)
                            
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg150", costEgg: 150000)
                                .frame(width: width * 0.2)
                        }
                        GridRow {
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg200", costEgg: 200000)
                                .frame(width: width * 0.2)
                            
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg250", costEgg: 250000)
                                .frame(width: width * 0.2)
                            
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg300", costEgg: 300000)
                                .frame(width: width * 0.2)
                        }
                        GridRow {
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg500", costEgg: 500000)
                                .frame(width: width * 0.2)
                            
                            shopEggButton(playerViewModel: playerViewModel, imageName: "egg1000", costEgg: 1000000)
                                .frame(width: width * 0.2)
                        }
                    }
                    .background {
                        Image("opacityBg")
                            .resizable()
                            .frame(width: width * 0.85, height: height * 0.75)
                    }
                    .frame(width: width * 0.8, height: height * 0.7)
                    .padding(.bottom, height * 0.1)
                    
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct shopEggButton: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    let imageName: String
    let costEgg: Int
    
    var isPurchased: Bool {
        playerViewModel.player.eggImageCollection.contains(imageName)
    }
    
    var canAfford: Bool {
        playerViewModel.player.coins >= costEgg
    }
    
    var body: some View {
        Button {
            if playerViewModel.player.settings.vibrationEnabled == true {
                HapticManager.instance.impact(style: .light)
            }
            if isPurchased {
                playerViewModel.updateEggImage(imageName, cost: 0)
            }
            else if canAfford {
                playerViewModel.updateEggImage(imageName, cost: costEgg)
            }
        } label: {
            VStack {
                EggView(imageName: imageName)
                    .grayscale(isPurchased ? 0 : 1)
                ZStack {
                    Image("coinBg")
                        .resizable()
                        .scaledToFit()
                    Text(isPurchased ? "ACTIVE" : "\(costEgg)")
                        .foregroundStyle(.white )
                        .font(.caption)
                        .fontWeight(.black)
                }
            }
        }
        .disabled(isPurchased || !canAfford)
        .opacity(isPurchased ? 1.0 : (canAfford ? 1.0 : 0.5))
    }
}

