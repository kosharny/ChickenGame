//
//  SettingsBgView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct SettingsBgView: View {
    
    @Binding var path: NavigationPath
    
    let title: String
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            ZStack {
                BackgraundView()
                VStack {
                    HStack {
                        Button {
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
                    VStack {
                        Text(title)
                            .foregroundStyle(.white )
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.top, 40)
                        Spacer()
                        Text("TEXT")
                            .foregroundStyle(.white )
                            .fontWeight(.black)
                            .padding(.top, 40)
                        Spacer()
                    }
                    .background(content: {
                        Image("opacityBg")
                            .resizable()
                            .frame(width: width * 0.85, height: height * 0.85)
                    })
                    .frame(width: width * 0.85, height: height * 0.85)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
