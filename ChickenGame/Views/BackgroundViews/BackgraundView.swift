//
//  BackgraundView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct BackgraundView: View {
    
    var body: some View {
        ZStack {
            Image("bgMenu")
                .resizable()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgraundView()
}
