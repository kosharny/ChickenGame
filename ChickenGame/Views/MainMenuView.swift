//
//  MainMenuView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI



struct MainMenuView: View {
    @Binding var path: NavigationPath
    
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
                
                VStack{
                    HStack {
                        Button {
                            path.append(Route.settings)
                        } label: {
                            Image("menuButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.2)
                        }
                        Spacer()
                        Button {
                            path.append(Route.info)
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
    }
}

//#Preview {
//    MainMenuView(path: NavigationPath([Route.play]))
//}
