//
//  SkinSelectionView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 14.12.2025.
//

import SwiftUI

struct SkinSelectionView: View {
    
    @StateObject var profileViewModel: ProfileViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Choose a new skin")
                .foregroundStyle(.white )
                .font(.largeTitle)
                .fontWeight(.black)
            HStack(spacing: 40) {
                Button {
                    profileViewModel.imageName = "chickenMain"
                    isPresented = false
                } label: {
                    SkinOption(skinName: "chickenMain")
                }
                
                Button {
                    profileViewModel.imageName = "chickenSkin"
                    isPresented = false
                } label: {
                    SkinOption(skinName: "chickenSkin")
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(15)
        .presentationBackground(Color.black.opacity(0.8))
        .presentationDetents([.fraction(0.4)])
    }
}


struct SkinOption: View {
    
    let skinName: String
    
    var body: some View {
        ZStack {
            Image("lavelBg")
                .resizable()
                .scaledToFit()
            Image(skinName)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
        }
    }
}
