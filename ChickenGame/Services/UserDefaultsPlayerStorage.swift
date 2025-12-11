//
//  UserDefaultsPlayerStorage.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//

import Foundation

protocol PlayerStorage {
    func load() -> PlayerData?
    func save(_ data: PlayerData)
}

final class UserDefaultsPlayerStorage: PlayerStorage {
    private let key = "player_data"

    func load() -> PlayerData? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(PlayerData.self, from: data)
    }

    func save(_ data: PlayerData) {
        let encoded = try? JSONEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: key)
    }
}
