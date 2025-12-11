//
//  GameView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct GameView: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            ZStack {
                GameBackgroundView()
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
//                            CoinView()
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
                        }
                        .padding(.trailing, 30)
                        Button {
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
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AppNavigation()
}
