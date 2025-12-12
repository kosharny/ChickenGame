//
//  PlayerViewModel.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//

import Foundation
import SwiftUI
import Combine


final class PlayerViewModel: ObservableObject {

    @Published private(set) var player: PlayerData
    
    private let storage: PlayerStorage

    init(storage: PlayerStorage = UserDefaultsPlayerStorage()) {
        self.storage = storage
        self.player = storage.load() ?? PlayerData(
            name: "USERNAME",
            email: "EMAIL",
            settings: PlayerSettings(soundEnabled: true, notificationsEnabled: true, vibrationEnabled: true),
            scores: [],
            coins: 1000
        )
    }

    func updateName(_ name: String) {
        player.name = name
        save()
    }

    func updateEmail(_ email: String) {
        player.email = email
        save()
    }

    func updateSettings(_ settings: PlayerSettings) {
        player.settings = settings
        save()
    }

    func addScore(_ score: Int) {
        player.scores.append(score)
        save()
    }

    func addCoins(_ amount: Int) {
        player.coins += amount
        save()
    }
    
    func nextLavel() {
        player.level += 1
        save()
    }

    func spendCoins(_ amount: Int) {
        player.coins = max(0, player.coins - amount)
        save()
    }

    private func save() {
        storage.save(player)
    }
}
