//
//  ProfileViewModel.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {

    @Published var name: String
    @Published var email: String

    @Published private(set) var coins: Int
    @Published private(set) var scores: [Int]

    private let playerVM: PlayerViewModel
    private var cancellables = Set<AnyCancellable>()

    init(playerVM: PlayerViewModel) {
        self.playerVM = playerVM

        self.name = playerVM.player.name
        self.email = playerVM.player.email

        self.coins = playerVM.player.coins
        self.scores = playerVM.player.scores

        playerVM.$player
            .sink { [weak self] player in
                self?.coins = player.coins
                self?.scores = player.scores
            }
            .store(in: &cancellables)
    }

    func saveProfile() {
        playerVM.updateName(name)
        playerVM.updateEmail(email)
    }
}
