//
//  LeaderboardViewModel.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 13.12.2025.
//

import Foundation
import SwiftUI
import Combine

final class LeaderboardViewModel: ObservableObject {
    @Published private(set) var scores: [Int] = []
    @Published private(set) var name: String = ""
    @Published private(set) var imageName: String = ""
    @Published private(set) var vibrationEnabled: Bool = false
    
    private let playerVM: PlayerViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(playerVM: PlayerViewModel) {
        self.playerVM = playerVM
        
        sync(with: playerVM.player)
        
        playerVM.$player
            .sink { [weak self] player in
                self?.sync(with: player)
            }
            .store(in: &cancellables)
    }
    
    private func sync(with player: PlayerData) {
        scores = player.scores
        name = player.name
        imageName = player.imageName
        vibrationEnabled = player.settings.vibrationEnabled
    }
}
