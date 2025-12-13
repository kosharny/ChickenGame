//
//  HowToPlayView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct HowToPlayView: View {
    
    @Binding var path: NavigationPath
    private let titleText = "HOW TO PLAY"
    
    var body: some View {
        SettingsBgView(path: $path, title: titleText)
    }
}

