//
//  SoundManager.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 12.12.2025.
//

import Foundation
import AVFoundation

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?

    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Ошибка: Файл \(soundName) не найден")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            player?.numberOfLoops = -1
            
            player?.play()
        } catch let error {
            print("Ошибка воспроизведения: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
