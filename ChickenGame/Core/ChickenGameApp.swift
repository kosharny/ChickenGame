//
//  ChickenGameApp.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI

@main
struct ChickenGameApp: App {
    @StateObject var playerViewModel = PlayerViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(playerViewModel)
        }
    }
}
