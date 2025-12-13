//
//  ProfileView.swift
//  ChickenGame
//
//  Created by Maksim Kosharny on 10.12.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var profileViewModel: ProfileViewModel
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
                    ZStack {
                        Image("opacityBg")
                            .resizable()
                            .frame(width: width * 0.75, height: height * 0.55)
                            .padding(.bottom, 40)
                        VStack {
                            Text("PROFILE")
                                .foregroundStyle(.white )
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .padding(.bottom, 80)
                            Button {
                                
                            } label: {
                                ZStack {
                                    Image("lavelBg")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: width * 0.3)
                                    Image(systemName: "square.and.pencil.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: width * 0.07)
                                        .foregroundColor(.green)
                                        .offset(y: 40)
                                }
                            }
                            
                            CustomTextField(text: $profileViewModel.name, placeholder: "USERNAME")
                                .frame(width: width * 0.6)
                            CustomTextField(text: $profileViewModel.email, placeholder: "EMAIL")
                                .frame(width: width * 0.6)
                                .padding(.bottom, 60)
                            
                        }
                        
                    }
                    Button {
                        profileViewModel.saveProfile()
                        path.removeLast()
                    } label: {
                        Image("saveButton")
                            .resizable()
                            .frame(width: width * 0.5, height: height * 0.15)
                    }
                    
                }
                .padding(.bottom, 40)
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    
}

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .foregroundStyle(.white )
                .font(.title3)
                .fontWeight(.black)
                .padding(.leading, 15)
            Image(systemName: "square.and.pencil")
                .foregroundColor(.white)
                .padding(.trailing, 15)
        }
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.purple)
        )
        .padding(.horizontal)
    }
}

