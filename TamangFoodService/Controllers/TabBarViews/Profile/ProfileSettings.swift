//
//  ProfileSettings.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI

struct ProfileSettings: View {
    @State private var name: String = "Sajin Tamang"
    @State private var email: String = "SajinTamang@Figma.com"
    @State private var phone: String = "+61 04133398285"
    @State private var password: String = "*********"
    
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack {
                
                NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    
                    //MARK: Navigation View
                    ZStack{
                        Text("Profile Settings")
                            .font(.customYuGothicfont(.semiBold, fontSize: 18))
                        HStack {
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("back")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            .foregroundColor(.white)
                            .offset(x: 30)
                            Spacer()
                        }
                    }
                    
                    //MARK: All Views are here
                    
                    ScrollView(showsIndicators: false) {
                        Spacer().frame(height: 15)
                        
                        //MARK:  FULL NAME
                        VStack(spacing: 15) {
                            Text("FULL NAME")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.subTitle)

                            TextField("", text: $name)
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.lightBlack2)
                            
                            Divider()
                                .foregroundStyle(Color.lightBlack2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }.padding(.horizontal, 24)
                        Spacer().frame(height: 15)
                        
                        //MARK:  Email Address
                        VStack(spacing: 15) {
                            Text("EMAIL ADDRESS")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.subTitle)
                            
                            TextField("", text: $email)
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.lightBlack2)
                            
                            Divider()
                                .foregroundStyle(Color.lightBlack2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }.padding(.horizontal, 24)
                        Spacer().frame(height: 15)
                        
                        //MARK:  PHONE NUMBER
                        VStack(spacing: 15) {
                            Text("PHONE NUMBER")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.subTitle)
                            
                            TextField("", text: $phone)
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.lightBlack2)
                            
                            Divider()
                                .foregroundStyle(Color.lightBlack2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }.padding(.horizontal, 24)
                        Spacer().frame(height: 15)
                        
                        //MARK:  PASSWORD
                        VStack(spacing: 15) {
                            Text("PASSWORD")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.subTitle)
                            
                            HStack {
                                SecureField("", text: $password)
                                    .font(.customYuGothicfont(.regular, fontSize: 17))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(Color.lightBlack2)
                                
                                Spacer()
                                
                                Button {
                                    isNavigationActive = true
                                    selectedDestination = .changePassword
                                    
                                } label: {
                                    Text("Change")
                                        .foregroundStyle(Color.lightYellow)
                                        .padding(.trailing)
                                }
                            }
                            Divider()
                                .foregroundStyle(Color.lightBlack2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }.padding(.horizontal, 24)
                        Spacer().frame(height: 15)
                        
                        
                    }
                    
                    RoundButton(title: "CHANGE SETTINGS") {
                        mode.wrappedValue.dismiss()
                    }
                }
            }.padding(.top, 20)
        } .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    ProfileSettings()
}
