//
//  PlaingGameViewModel.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//
//


import Foundation
import Combine
import SwiftUI

final class PlaingGameViewModel: ObservableObject {
    
    @Published private(set) var eggs: [Egg] = []
    @Published private(set) var timeLeft: Int = 60
    @Published private(set) var lives: Int = 3
    @Published var state: GameState = .ready
    @Published var gameFieldSize: CGSize = .zero
    @Published var coinsGame: Int = 0
    
    private var tickCancellable: AnyCancellable?
    private var lastTickDate: Date = Date()
    
    private var spawnInterval: TimeInterval = 1.0
    private var eggLifeTime: TimeInterval = 3.0
    private var timeSinceLastSpawn: TimeInterval = 0
    
    var level: Int
    
    let playerVM: PlayerViewModel
    
    var currentSkin: String {
        playerVM.player.eggImageName
    }
    
    var coinAmount: Int {
        playerVM.player.coins
    }
    
    private let totalGameDuration: Int = 60
    
    private var cancellables = Set<AnyCancellable>()
    
    init(playerVM: PlayerViewModel, level: Int = 1) {
        self.playerVM = playerVM
        self.level = max(1, min(9, level))
        configureForLevel(self.level)
        resetGame()
    }
    
    func changeLevel(_ newLevel: Int) {
        let clamped = max(1, min(9, newLevel))
        guard clamped != level else { return }
        level = clamped
        configureForLevel(level)
        resetGame()
    }
    
    private func configureForLevel(_ level: Int) {
        let minSpawn: TimeInterval = 0.35
        let maxSpawn: TimeInterval = 1.6
        let minLife: TimeInterval = 0.6
        let maxLife: TimeInterval = 4.0
        
        let t = Double(level - 1) / 8.0
        spawnInterval = maxSpawn - (maxSpawn - minSpawn) * t
        eggLifeTime = maxLife - (maxLife - minLife) * t
    }
    
    func resetGame() {
        eggs.removeAll()
        timeLeft = totalGameDuration
        lives = 3
        state = .ready
        timeSinceLastSpawn = 0
        invalidateTimers()
    }
    
    
    func startGame() {
        guard state != .playing else { return }
        state = .playing
        lastTickDate = Date()
        setupTick()
    }
    
    func pauseGame() {
        guard state == .playing else { return }
        state = .paused
        invalidateTimers()
    }
    
    func resumeGame() {
        guard state == .paused else { return }
        state = .playing
        lastTickDate = Date()
        setupTick()
    }
    
    func stopGame() {
        invalidateTimers()
        state = .ready
    }
    
    private func setupTick() {
        invalidateTimers()
        tickCancellable = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] now in
                self?.tick(now: now)
            }
    }
    
    private func invalidateTimers() {
        tickCancellable?.cancel()
        tickCancellable = nil
    }
    
    private func tick(now: Date) {
        let dt = now.timeIntervalSince(lastTickDate)
        lastTickDate = now
        
        guard state == .playing else { return }
        
        timeSinceLastSpawn += dt
        if timeSinceLastSpawn >= spawnInterval {
            timeSinceLastSpawn = 0
            spawnEgg()
        }
        
        accumulateCountdown(by: dt)
        
        checkExpiredEggs(currentTime: now.timeIntervalSince1970)
        
        if timeLeft <= 0 {
            invalidateTimers()
            state = (lives > 0) ? .won : .lost
            if state == .won {
                if playerVM.player.level == level {
                    playerVM.nextLavel()
                }
                playerVM.addCoins(coinsGame)
                playerVM.addScore(coinsGame)
            } else if state == .lost {
                coinsGame = 0
            }
        }
    }
    
    private var countdownAccumulator: TimeInterval = 0
    private func accumulateCountdown(by dt: TimeInterval) {
        countdownAccumulator += dt
        while countdownAccumulator >= 1.0 {
            countdownAccumulator -= 1.0
            timeLeft = max(0, timeLeft - 1)
        }
    }
    
    private func spawnEgg() {
        let now = Date().timeIntervalSince1970
        
        var new = eggs
        let egg = Egg(
            x: CGFloat(Double.random(in: 0.08...0.92)),
            y: CGFloat(Double.random(in: 0.12...0.78)), // avoid top controls and bottom hearts
            spawnTime: now,
            lifeTime: eggLifeTime
        )
        new.append(egg)
        eggs = new
    }
    
    private func checkExpiredEggs(currentTime: TimeInterval) {
        
        let beforeCount = eggs.count
        
        let expired = eggs.filter { currentTime - $0.spawnTime >= $0.lifeTime }
        
        if !expired.isEmpty {
            eggs = eggs.filter { currentTime - $0.spawnTime < $0.lifeTime }
            loseLives(expired.count)
        }
        
        
        let removedCount = beforeCount - eggs.count
        
        if removedCount > 0 {
            loseLives(removedCount)
        }
    }
    
    private func loseLives(_ count: Int) {
        for _ in 0..<count {
            lives = max(0, lives - 1)
            if lives == 0 {
                invalidateTimers()
                state = .lost
                break
            }
        }
    }
    
    
    private func removeEgg(_ egg: Egg) {
        if let idx = eggs.firstIndex(of: egg) {
            eggs.remove(at: idx)
        }
    }
    
    func tapEgg(_ egg: Egg) {
        guard state == .playing else { return }
        removeEgg(egg)
        coinsGame += 100
    }
}
