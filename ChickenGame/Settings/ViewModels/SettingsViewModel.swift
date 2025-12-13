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
    @Published private(set) var coins: Int
    
    private let playerVM: PlayerViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(playerVM: PlayerViewModel) {
        self.playerVM = playerVM
        
        self.settings = playerVM.player.settings
        self.coins = playerVM.player.coins
        
        playerVM.$player
            .map(\.coins)
            .removeDuplicates()
            .sink { [weak self] coins in
                self?.coins = coins
            }
            .store(in: &cancellables)
    }
    
    func save() {
        playerVM.updateSettings(settings)
    }
}
