//
//  PauseGameView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct PauseGameView: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        ResultGameView(path: $path, titleText: "PAUSED", isFinish: false, isLose: false, imageName: "playButton")
    }
}

#Preview {
    AppNavigation()
}
