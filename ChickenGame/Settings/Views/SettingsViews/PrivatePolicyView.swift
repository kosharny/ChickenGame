//
//  PrivatePolicyView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct PrivatePolicyView: View {
    @Binding var path: NavigationPath
    private let titleText = "PRIVATE POLICY"
    
    var body: some View {
        SettingsBgView(path: $path, title: titleText)
    }
}
