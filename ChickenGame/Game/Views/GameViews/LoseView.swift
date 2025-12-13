//
//  LoseView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct LoseView: View {
    
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ResultGameView(plaingGameViewModel: plaingGameViewModel, path: $path, titleText: "YOU LOSE!", isFinish: true, isLose: true, imageName: "tryAgainButton")
    }
}

#Preview {
    AppNavigation()
}
