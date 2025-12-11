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
}

struct AppNavigation: View {
    @EnvironmentObject var playerVM: PlayerViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            MainMenuView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .menu:
                        MainMenuView(path: $path)
                    case .play:
                        SelectionLevelView(plaingGameViewModel:PlaingGameViewModel(playerVM: playerVM, level: 1), path: $path)
                    case .settings:
                        SettingsView(path: $path)
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
                        GameView(plaingGameViewModel: PlaingGameViewModel(playerVM: playerVM, level: 1), path: $path)
                    case .pauseGame:
                        PauseGameView(path: $path)
                    case .winGame:
                        WinView(path: $path)
                    case .loseGame:
                        LoseView(path: $path)
                    }
                }
        }
        
    }
}

#Preview {
    AppNavigation()
}
