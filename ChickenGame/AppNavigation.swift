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
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            MainMenuView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .menu:
                        MainMenuView(path: $path)
                    case .play:
                        SelectionLevelView(path: $path)
                    case .settings:
                        SettingsView(path: $path)
                    case .profile:
                        ProfileView(path: $path)
                    case .settingsGame:
                        SettingsGameView(path: $path)
                    case .leaderboard:
                        LeaderboardView(path: $path)
                    case .howToPlay:
                        HowToPlayView(path: $path)
                    case .termsOfUse:
                        TermsOfUseView(path: $path)
                    case .privatePolicy:
                        PrivatePolicyView(path: $path)
                    case .game:
                        GameView(path: $path)
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
