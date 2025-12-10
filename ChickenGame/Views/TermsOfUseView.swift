//
//  TermsOgUseView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct TermsOfUseView: View {
    @Binding var path: NavigationPath
    private let titleText = "TERMS OF USE"
    
    var body: some View {
        SettingsBgView(path: $path, title: titleText)
    }
}

#Preview {
    AppNavigation()
}
