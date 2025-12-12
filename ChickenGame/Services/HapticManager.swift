//
//  HapticManager.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 12.12.2025.
//

import SwiftUI
import UIKit

class HapticManager {
    static let instance = HapticManager() // Синглтон
    
//    // Для уведомлений: .success, .error, .warning
//    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(type)
//    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare() 
        generator.impactOccurred()
    }
}
