//
//  ResultGameView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct ResultGameView: View {
    
    @Binding var path: NavigationPath
    
    let titleText: String
    let isFinish: Bool
    let isLose: Bool
    let imageName: String
    
    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height
            let width = geo.size.width
            ZStack {
                GameBackgroundView()
                VStack {
                    Spacer()
                    Text(titleText)
                        .foregroundStyle(.white )
                        .font(.system(size: 80))
                        .fontWeight(.black)
                    if isFinish {
                        ScoreView(titleText: "SCORE")
                            .frame(width: width * 0.85, height: height * 0.07)
                        ScoreView(titleText: "BEST")
                            .frame(width: width * 0.85, height: height * 0.07)
                    }
                    HStack {
                        Button {
                            path.append(Route.menu)
                        } label: {
                            Text("HOME")
                                .underline()
                                .foregroundStyle(.white )
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .padding(.top, 40)
                        }
                        if !isLose {
                            Spacer()
                            Button {
                                path.append(Route.game)
                            } label: {
                                Text("RESTART")
                                    .underline()
                                    .foregroundStyle(.white )
                                    .font(.largeTitle)
                                    .fontWeight(.black)
                                    .padding(.top, 40)
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                    Button {
                        if isLose {
                            path.append(Route.play)
                        } else {
                            path.removeLast()
                        }
                    } label: {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.6)
                            .padding(height * 0.1)
                    }
                }
                .ignoresSafeArea()
                .frame(width: width)
                .background(Color.black.opacity(0.5))
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    
}

struct ScoreView: View {
    
    let titleText: String
    
    var body: some View {
        HStack {
            Text(titleText)
                .foregroundStyle(.white )
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            Text("0000")
                .foregroundStyle(.white )
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.green)
        }
        
    }
}

#Preview {
    AppNavigation()
}
