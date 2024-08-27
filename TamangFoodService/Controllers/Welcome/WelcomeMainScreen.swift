//
//  WelcomeMainScreen.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 31/07/2024.
//

import SwiftUI

struct WelcomeMainScreen: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("CircleBackground")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 450, alignment: .leading)
                    .offset(x: -50, y: -280)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                        //MARK: TITLE AND LOGO
                        HStack {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70, alignment: .leading)
                                .padding()
                            VStack {
                                Text(" Tamang ")
                                Text("FoodService")
                            }
                            .font(.customPoppinsfont(.semiBold, fontSize: 45))
                        }.offset(x: -10, y: 70)
                        
                        //MARK: MIDDLE IMAGE
                        Spacer()
                            .frame(width: 100, height: 100)
                        Image("welcomIceCream")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400, alignment: .leading)
                        
                        //MARK: BOTTOM VIEW
                        VStack {
                            Text(" Welcome ")
                                .font(.customPoppinsfont(.extraBold, fontSize: 24))
                                .padding(.vertical)
                            Text("It’s a pleasure to meet you. We are excited that you’re here so let’s get started!")
                                .font(.customPoppinsfont(.regular, fontSize: 15))
                                .foregroundColor(Color.lightBlack)
                                .padding(.horizontal, 30)
                            
                            Spacer()
                                .frame(width: 100, height: 20)
                            
                            NavigationLink(
                                destination: WalkThroughScreen(tutorials: dummyTutorials),
                                label: {
                                    Text("GET STARTED")
                                        .font(.customYuGothicfont(.semiBold, fontSize: 20))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.lightYellow)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 30)
                                        .padding(.top, 30)
                                        .padding(.bottom, 30)
                                })
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    WelcomeMainScreen()
}
