//
//  SettingsViewModel.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//

import Foundation
import SwiftUI
import Combine

final class SettingsViewModel: ObservableObject {
    @Published var settings: PlayerSettings

    let playerVM: PlayerViewModel

    init(playerVM: PlayerViewModel) {
        self.playerVM = playerVM
        self.settings = playerVM.player.settings
    }

    func save() {
        playerVM.updateSettings(settings)
    }
}
