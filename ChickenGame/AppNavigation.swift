//
//  AppNavigation.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

enum Route: Hashable {
    case play
    case info
    case settings
    case profile
}

struct AppNavigation: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            MainMenuView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .info:
                        Text("Info")
                    case .play:
                        SelectionLevelView(path: $path)
                    case .settings:
                        SettingsView(path: $path)
                    case .profile:
                        ProfileView(path: $path)
                    }
                }
        }
        
    }
}

#Preview {
    AppNavigation()
}
