//
//  EggModel.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//

import Foundation
import SwiftUI

struct Egg: Identifiable, Equatable {
    let id = UUID()
    var x: CGFloat   
    var y: CGFloat
    let spawnTime: TimeInterval
    let lifeTime: TimeInterval
}
