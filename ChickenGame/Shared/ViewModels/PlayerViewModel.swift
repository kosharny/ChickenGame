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
            imageName: "chickenMain",
            settings: PlayerSettings(soundEnabled: true, notificationsEnabled: true, vibrationEnabled: true),
            scores: [],
            coins: 1000,
            level: 1,
            eggImageName: "egg",
            eggImageCollection: ["egg"],
        )
    }
    
    func updatePlayer(_ player: PlayerData) {
        self.player = player
        save()
    }
    
    func upadteCoinsAndEggName(_ coins: Int, and eggImageName: String) {
        player.coins = coins
        player.eggImageName = eggImageName
        save()
    }
    
    func updateName(_ name: String) {
        player.name = name
        save()
    }
    
    func updateEmail(_ email: String) {
        player.email = email
        save()
    }
    
    func updateImage(name: String) {
        player.imageName = name
        save()
    }
    
    func updateSettings(_ settings: PlayerSettings) {
        player.settings = settings
        save()
    }
    
    func updateEggImage(_ eggName: String, cost: Int) {
        if cost == 0 || player.coins >= cost {
            player.coins -= cost
            player.eggImageName = eggName
            
            if cost > 0 {
                player.eggImageCollection.append(eggName)
            }
        }
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
