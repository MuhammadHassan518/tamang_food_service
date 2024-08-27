//
//  ForgetPasswordScreen.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI

struct ForgetPassScreen: View {
    
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var email: String = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    var body: some View {
        NavigationView{
            ZStack {
                NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    //MARK: Navigation View
                    ZStack{
                        Text("Forget Password")
                            .font(.customYuGothicfont(.semiBold, fontSize: 18))
                            .foregroundColor(Color.lightBlack2)
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
                    
                    ScrollView {
                        VStack(spacing: 20){
                            Text("Forget Password")
                                .font(.customYuGothicfont(.light, fontSize: 35))
                                .foregroundStyle(Color.lightBlack2)
                                .padding(.top, 30)
                            
                            Text("Enter your email address and we will send you a reset instructions.").font(.customYuGothicfont(.regular, fontSize: 17))
                                .foregroundStyle(Color.subTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 34)
                            
                            //MARK: Email View
                            VStack(spacing: 20){
                                
                                Text("EMAIL ADDRESS")
                                    .font(.customYuGothicfont(.light, fontSize: 14))
                                    .foregroundStyle(Color.subTitle)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 34)
                             
                           
                                TextField("Email@Address. com", text: $email)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .foregroundColor(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                  
                                Divider()
                                    .frame(height: 1)
                                    .foregroundColor(Color(hex: "#F3F2F2"))
                                    .padding(.horizontal, 34)
                            }
                            
                            
                            //MARK: Reseat Password Button View
                            Button(action: {
                                isNavigationActive = true
                                selectedDestination = .resetEmail
                            }, label: {
                                BigYellowButton(buttonTitle: "RESET PASSWORD", isBold: true)
                                    .padding(.horizontal, 34)
                            })
                            
                        }
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
    ForgetPassScreen()
}
