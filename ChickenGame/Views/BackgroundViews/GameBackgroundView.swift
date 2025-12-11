//
//  GameBackgroundView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct GameBackgroundView: View {
    var body: some View {
        ZStack {
            Image("gameBg")
                .resizable()
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    GameBackgroundView()
}
