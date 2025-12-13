//
//  ShopViewModel.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 13.12.2025.
//

import Foundation
import SwiftUI
import Combine

final class ShopViewModel: ObservableObject {
    @Published private(set) var vibrationEnabled: Bool = false
    @Published private(set) var eggImageCollection: [String] = []
    @Published private(set) var eggImageName: String = ""
    @Published private(set) var coins: Int = 0
    
    private let playerVM: PlayerViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(playerVM: PlayerViewModel) {
        self.playerVM = playerVM
        
        self.vibrationEnabled = playerVM.player.settings.vibrationEnabled
        self.coins = playerVM.player.coins
        self.eggImageCollection = playerVM.player.eggImageCollection
        self.eggImageName = playerVM.player.eggImageName
        self.coins = playerVM.player.coins
        
        playerVM.$player
            .sink { [weak self] player in
                self?.sync(with: player)
            }
            .store(in: &cancellables)
    }
    
    
    func updateEggImage(_ eggImage: String, cost: Int) {
        playerVM.updateEggImage(eggImage, cost: cost)
        eggImageName = eggImage
    }
    
    private func sync(with player: PlayerData) {
        coins = player.coins
        eggImageCollection = player.eggImageCollection
        eggImageName = player.eggImageName
        vibrationEnabled = player.settings.vibrationEnabled
    }
}
