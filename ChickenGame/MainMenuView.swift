//
//  MainMenuView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI

enum Route: Hashable {
    case play
    case info
    case settings
}

struct MainMenuView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
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
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .info:
                    Text("Info")
                case .play:
                    SelectionLevelView()
                case .settings:
                    Text("Settings")
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
}
