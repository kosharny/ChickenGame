//
//  CoinView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 11.12.2025.
//

import SwiftUI

struct CoinView: View {
    
    var cionCount: Int
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            ZStack {
                Image("coinBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.25)
                    .padding(.trailing)
                Image("coin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.12)
                    .padding(.trailing, -(width * 0.2))
                Text("\(cionCount)")
                    .foregroundStyle(.white )
                    .font(.title3)
                    .fontWeight(.black)
                    .padding(.trailing, width * 0.14)
            }
        }
    }
}

#Preview {
    CoinView(cionCount: 1000)
}
