//
//  AppNavigation.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

enum Route: Hashable {
    case play
    case settings
    case profile
    case settingsGame
    case leaderboard
    case howToPlay
    case termsOfUse
    case privatePolicy
    case game
    case menu
    case pauseGame
    case winGame
    case loseGame
    case shop
}

struct AppNavigation: View {
    @EnvironmentObject var playerVM: PlayerViewModel
    @StateObject private var plaingGameViewModel = PlaingGameViewModel(playerVM: PlayerViewModel())
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            MainMenuView(playerViewModel: playerVM, path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .menu:
                        MainMenuView(playerViewModel: playerVM, path: $path)
                    case .play:
                        SelectionLevelView(playerViewModel: playerVM, plaingGameViewModel: plaingGameViewModel, path: $path)
                    case .settings:
                        SettingsView(settingsViewModel: SettingsViewModel(playerVM: playerVM), path: $path)
                    case .profile:
                        ProfileView(profileViewModel: ProfileViewModel(playerVM: playerVM), path: $path)
                    case .settingsGame:
                        SettingsGameView(settingsViewModel: SettingsViewModel(playerVM: playerVM), path: $path)
                    case .leaderboard:
                        LeaderboardView(playerViewModel: playerVM, path: $path)
                    case .howToPlay:
                        HowToPlayView(path: $path)
                    case .termsOfUse:
                        TermsOfUseView(path: $path)
                    case .privatePolicy:
                        PrivatePolicyView(path: $path)
                    case .game:
                        GameView(playerViewModel: playerVM, plaingGameViewModel: plaingGameViewModel, path: $path)
                    case .pauseGame:
                        PauseGameView(plaingGameViewModel: plaingGameViewModel, path: $path)
                    case .winGame:
                        WinView(plaingGameViewModel: plaingGameViewModel, path: $path)
                    case .loseGame:
                        LoseView(plaingGameViewModel: plaingGameViewModel, path: $path)
                    case .shop:
                        ShopView(playerViewModel: playerVM, path: $path)
                    }
                }
        }
        
    }
}

#Preview {
    AppNavigation()
}
