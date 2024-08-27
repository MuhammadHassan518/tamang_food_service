//
//  WalkThroughScreen.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 31/07/2024.
//

import SwiftUI

struct WalkThroughScreen: View {
    
    var tutorials: [TutorialModel]
    var body: some View {
        NavigationView{
            ZStack {
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
                        }.offset(x: -10, y: 30)
                        
                        //MARK: MIDDLE IMAGE
                        Spacer()
                            .frame(width: 100, height: 30)
                        
                        ImageSlider(tutorials: tutorials)
                            .frame(width: .screenWidth - 50, height: 570)
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
#Preview {
    WalkThroughScreen(tutorials: dummyTutorials)
}

struct ImageSlider: View {
    
    var tutorials: [TutorialModel]
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex.animation()) {
                ForEach(tutorials) { item in
                    VStack {
                        Image(item.image)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .scaledToFill()
                        
                        Text(item.title)
                            .font(.customPoppinsfont(.extraBold, fontSize: 24))
                            .padding(.top, 20)
                        
                        Text(item.message)
                            .font(.customPoppinsfont(.regular, fontSize: 15))
                            .foregroundColor(Color.lightBlack)
                            .frame(height: 50)
                            .padding(.horizontal, 20)
                        
                    }.tag(item.id)
                        .padding(.bottom, 30)
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            if selectedIndex < tutorials.count - 1 {
                Button(action: {
                    selectedIndex += 1
                }, label: {
                    BigYellowButton(buttonTitle: "GET STARTED", isBold: true)
                })
            }else {
                NavigationLink(destination: SignInScreen()) {
                    BigYellowButton(buttonTitle: "GET STARTED", isBold: true)
                }
            }
        }.edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear {
                setupPageControlAppearance()
            }
    }
}

private func setupPageControlAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor = Color.rgbToUIColor(r: 34, g: 164, b: 93, a: 1)
    UIPageControl.appearance().pageIndicatorTintColor = Color.rgbToUIColor(r: 134, g: 134, b: 134, a: 1)
    
}

