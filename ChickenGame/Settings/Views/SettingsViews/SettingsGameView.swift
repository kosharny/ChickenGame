//
//  SettingsGameView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct SettingsGameView: View {
    
    @StateObject var settingsViewModel: SettingsViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            ZStack {
                BackgraundView()
                VStack {
                    HStack {
                        Button {
                            if settingsViewModel.settings.vibrationEnabled == true {
                                HapticManager.instance.impact(style: .light)
                            }
                            path.removeLast()
                        } label: {
                            Image("backButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.2)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button {
                        if settingsViewModel.settings.vibrationEnabled == true {
                            HapticManager.instance.impact(style: .light)
                        }
                        settingsViewModel.save()
                        path.removeLast()
                        if settingsViewModel.settings.soundEnabled == false {
                            SoundManager.instance.stopSound()
                        } else {
                            SoundManager.instance.playSound(soundName: "bg")
                        }
                    } label: {
                        Image("saveButton")
                            .resizable()
                            .frame(width: width * 0.5, height: height * 0.15)
                    }
                }
                VStack {
                    Text("SETTINGS")
                        .foregroundStyle(.white )
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.bottom, 40)
                    CustomTogleView(isOn: $settingsViewModel.settings.soundEnabled, text: "SOUND")
                        .padding(.bottom, 20)
                    CustomTogleView(isOn: $settingsViewModel.settings.notificationsEnabled, text: "NOTIFICATION")
                        .padding(.bottom, 20)
                    CustomTogleView(isOn: $settingsViewModel.settings.vibrationEnabled, text: "VIBRATION")
                        .padding(.bottom, 60)
                }
                .background(content: {
                    Image("opacityBg")
                        .resizable()
                        .frame(width: width * 0.85, height: height * 0.35)
                        .padding(.bottom, 40)
                })
                .frame(width: width * 0.8, height: height * 0.5)
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct CustomTogleView: View {
    
    @Binding var isOn: Bool
    let text: String
    
    var body: some View {
        Toggle(isOn: $isOn) {
            // Метка (Label) для переключателя
            Text(text)
                .foregroundStyle(.white )
                .font(.title2)
                .fontWeight(.black)
        }
        .padding(.horizontal, 20)
    }
}

