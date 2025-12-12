//
//  PauseGameView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct PauseGameView: View {
    
    
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ResultGameView(plaingGameViewModel: plaingGameViewModel, path: $path, titleText: "PAUSED", isFinish: false, isLose: false, imageName: "playButton")
    }
}

#Preview {
    AppNavigation()
}
