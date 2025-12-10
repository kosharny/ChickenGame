//
//  LeaderboardView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct LeaderboardView: View {
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
                        path.removeLast()
                    } label: {
                        Image("saveButton")
                            .resizable()
                            .frame(width: width * 0.5, height: height * 0.15)
                    }
                }
                VStack(alignment: .center) {
                    Text("LEADERBOARD")
                        .foregroundStyle(.white )
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.bottom, 40)
                    ForEach(0...5, id: \.self) {_ in
                        UserRecordsView()
                            .frame(width: width * 0.8)
                    }
                }
                .background(content: {
                    Image("opacityBg")
                        .resizable()
                        .frame(width: width * 0.85, height: height * 0.65)
                })
                .frame(width: width * 0.85, height: height * 0.6)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct UserRecordsView: View {
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            HStack {
                Image("lavelBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.15)
                Spacer()
                Text("USERNAME")
                    .foregroundStyle(.white )
                    .font(.title2)
                    .fontWeight(.black)
                
                Spacer()
                Text("0000")
                    .foregroundStyle(.white )
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.purple)
            }
        }
    }
}

#Preview {
    AppNavigation()
}
