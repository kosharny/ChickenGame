//
//  LeaderboardView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct LeaderboardView: View {
    
    @StateObject var playerViewModel: PlayerViewModel
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
                    VStack(alignment: .center) {
                        Text("LEADERBOARD")
                            .foregroundStyle(.white )
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.bottom, 40)
                        
                        ForEach(0...playerViewModel.player.scores.count, id: \.self) {_ in
                            UserRecordsView(userName: playerViewModel.player.name, score: playerViewModel.player.scores.first ?? 0000)
                                .frame(width: width * 0.8)
                        }
                    }
                    .background(content: {
                        Image("opacityBg")
                            .resizable()
                            .frame(width: width * 0.85, height: height * 0.75)
                    })
                    .frame(width: width * 0.85, height: height * 0.7)
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct UserRecordsView: View {
    var userName: String
    var score: Int
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            HStack {
                Image("lavelBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.15)
                Spacer()
                Text(userName)
                    .foregroundStyle(.white )
                    .font(.title2)
                    .fontWeight(.black)
                
                Spacer()
                Text("\(score)")
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
