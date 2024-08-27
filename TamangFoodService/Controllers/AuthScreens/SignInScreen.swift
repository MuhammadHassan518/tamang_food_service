//
//  SignInScreen.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI

struct SignInScreen: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowPass = false
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
                        Text("Sign In")
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
                    
                    ScrollView {
                        VStack(spacing: 20){
                            
                            Text("Welcome to Tamang \n Food Services")
                                .font(.customYuGothicfont(.light, fontSize: 33))
                                .foregroundStyle(Color.lightBlack2)
                                .padding(.top, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 24)
                            
                            Text("Enter your Phone number or Email address for sign in. Enjoy your food :)")
                                .font(.customYuGothicfont(.regular, fontSize: 17))
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
                             
                                //MARK: Email Fields View
                                HStack{
                                    
                                    TextField("Email@Address. com", text: $email)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .foregroundColor(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                    
                                    Image("checkMark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                        .padding(.trailing, 34)
                                    
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .foregroundColor(Color(hex: "#F3F2F2"))
                                    .padding(.horizontal, 34)
                            }
                            
                            
                            //MARK: Password View
                            
                            VStack(spacing: 15){
                                
                                Text("PASSWORD")
                                    .font(.customYuGothicfont(.light, fontSize: 14))
                                    .foregroundStyle(Color.subTitle)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 34)
                             
                                HStack{
                                    
                                    if(isShowPass) {
                                        TextField("******", text: $password)
                                            .font(.customYuGothicfont(.regular, fontSize: 17))
                                            .foregroundColor(Color.lightBlack2)
                                            .padding(.horizontal, 34)
                                            .autocapitalization(.none)
                                            .autocorrectionDisabled()
                                    }else{
                                        SecureField("******", text: $password)
                                            .font(.customYuGothicfont(.regular, fontSize: 17))
                                            .foregroundColor(Color.lightBlack2)
                                            .padding(.horizontal, 34)
                                            .autocapitalization(.none)
                                            .autocorrectionDisabled()
                                    }
                                    
                                    
                                    Button(action: {
                                        print("Eyes opened")
                                        isShowPass = !isShowPass
                                    }, label: {
                                        Image(isShowPass ? "openEye" : "closeEye")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                            .padding(.trailing, 34)
                                    })
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .foregroundColor(Color(hex: "#F3F2F2"))
                                    .padding(.horizontal, 34)
                            }
                            
                            //MARK: Forget Password View
                            Button(action: {
                                isNavigationActive = true
                                selectedDestination = .forgetPassword
                            }, label: {
                                Text("Forget Password ?")
                                    .font(.customYuGothicfont(.light, fontSize: 14))
                                    .foregroundColor(Color.lightBlack2.opacity(0.64))
                            })
                                .padding(.vertical)
                            
                            //MARK: Sign In Button
                            
                            Button(action: {
                                isNavigationActive = true
                                selectedDestination = .home
                            }, label: {
                                BigYellowButton(buttonTitle: "SIGN IN", isBold: true)
                                    .padding(.horizontal, 34)
                            })
                            
                            //MARK: Don’t have account?
                            HStack {
                                
                                Text("Don’t have account?")
                                    .font(.customYuGothicfont(.light, fontSize: 15))
                                    .foregroundColor(Color.lightBlack2.opacity(0.64))
                                
                                Button(action: {
                                    isNavigationActive = true
                                    selectedDestination = .signup
                                }, label: {
                                    Text("Create new account.")
                                        .font(.customYuGothicfont(.light, fontSize: 15))
                                        .foregroundColor(Color.lightYellow2)
                                })
                                
                            }.offset(y: -20)
                            
                            
                            VStack {
                                Text("Or")
                                    .font(.customYuGothicfont(.semiBold, fontSize: 25))
                                    .foregroundColor(Color.lightBlack2.opacity(0.64))
                                
                                //MARK: facebook Button
                                
                                Button(action: {
                                    print("facebook Button tapped")
                                }) {
                                    HStack {
                                        Image("facebookSignIn")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .padding(.trailing)
                                        Text("CONNECT WITH FACEBOOK")
                                            .font(.customYuGothicfont(.semiBold, fontSize: 15))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.facebook)
                                    .cornerRadius(10)
                                }
                                .padding(.horizontal, 34)
                                .padding(.vertical, 15)
                                
                                //MARK: google Button
                                
                                Button(action: {
                                    print("google Button tapped")
                                }) {
                                    HStack {
                                        Image("google")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .padding(.trailing)
                                        Text("CONNECT WITH GOOGLE")
                                            .font(.customYuGothicfont(.semiBold, fontSize: 15))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.google)
                                    .cornerRadius(10)
                                }
                                .padding(.horizontal, 34)
                                .padding(.bottom, 15)
                            }.offset(y: -20)
                            
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
    SignInScreen()
}
