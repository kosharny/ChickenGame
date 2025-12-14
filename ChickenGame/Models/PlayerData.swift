//
//  PlayerData.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//

import Foundation

struct PlayerData: Codable {
    var name: String
    var email: String
    var imageName: String
    
    var settings: PlayerSettings
    
    var scores: [Int]             
    var coins: Int
    var level: Int
    var eggImageName: String
    var eggImageCollection: [String]
}
