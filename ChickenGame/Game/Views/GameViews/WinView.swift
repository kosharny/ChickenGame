//
//  WinView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct WinView: View {
    
    @ObservedObject var plaingGameViewModel: PlaingGameViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ResultGameView(plaingGameViewModel: plaingGameViewModel, path: $path, titleText: "YOU WIN!", isFinish: true, isLose: false, imageName: "nextButton")
    }
}

