//
//  SettingsView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var settingsViewModel: SettingsViewModel
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
                            if settingsViewModel.settings.vibrationEnabled == true {
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
                                Text("\(settingsViewModel.playerVM.player.coins)")
                                    .foregroundStyle(.white )
                                    .font(.caption)
                                    .fontWeight(.black)
                                    .padding(.trailing, width * 0.14)
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    Image("opacityBg")
                        .resizable()
                        .frame(width: width * 0.85, height: height * 0.75)
                        .padding(.bottom, 40)
                }
                VStack {
                    Text("MENU")
                        .foregroundStyle(.white )
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    buttonView(imageName: "profileButton", route: .profile)
                        .frame(width: width * 0.4)
                    buttonView(imageName: "settingsButton", route: .settingsGame)
                        .frame(width: width * 0.4)
                    buttonView(imageName: "leaderboardButton", route: .leaderboard)
                        .frame(width: width * 0.4)
                    buttonView(imageName: "privacyPolicyButton", route: .privatePolicy)
                        .frame(width: width * 0.4)
                    buttonView(imageName: "termOfUseButton", route: .termsOfUse)
                        .frame(width: width * 0.4)
                    
                }
                .padding(.top, 100)
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    private func buttonView(imageName: String, route: Route) -> some View {
        var body: some View {
            Button {
                if settingsViewModel.settings.vibrationEnabled == true {
                    HapticManager.instance.impact(style: .light)
                }
                path.append(route)
            } label: {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
            }
        }
        return body
    }
}

#Preview {
    AppNavigation()
}
