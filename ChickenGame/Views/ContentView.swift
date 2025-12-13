//
//  ContentView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 09.12.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @State private var showMainView = false
    
    var body: some View {
        Group {
            if showMainView {
                AppNavigation(playerVM: playerViewModel)
            } else {
                LaunchScreenView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut) {
                    showMainView = true
                }
            }
        }
    }
}

