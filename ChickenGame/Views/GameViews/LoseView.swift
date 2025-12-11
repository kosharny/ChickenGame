//
//  LoseView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct LoseView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        ResultGameView(path: $path, titleText: "YOU LOSE!", isFinish: true, isLose: true, imageName: "tryAgainButton")
    }
}

#Preview {
    AppNavigation()
}
