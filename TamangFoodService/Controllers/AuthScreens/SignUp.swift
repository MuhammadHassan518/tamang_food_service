//
//  SignUp.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowPass = false
    @State private var isExpanded = false
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
                        Text("Sign Up")
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
                            
                            
                            Text("Create Account")
                                .font(.customYuGothicfont(.light, fontSize: 34))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.lightBlack2)
                                .padding(.top, 30)
                                .padding(.horizontal, 30)
                            
                            
                            //MARK: Descrptions under title View
                            
                            VStack(alignment: .leading) {
                                Text("Enter your Name, Email and Password")
                                    .font(.customYuGothicfont(.regular, fontSize: 16))
                                    .foregroundColor(Color.subTitle)
                                
                                HStack {
                                    Text("for sign up.")
                                        .font(.customYuGothicfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.subTitle)
                                        .padding(.horizontal, 2)
                                    
                                    Button(action: {
                                        isNavigationActive = true
                                        selectedDestination = .signin
                                    }) {
                                        Text("Already have an account?")
                                            .font(.customYuGothicfont(.regular, fontSize: 16))
                                            .foregroundColor(Color.lightYellow)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 34)
                            
                            
                            //MARK: Name View
                            VStack(spacing: 20){
                                
                                Text("Full Name")
                                    .font(.customYuGothicfont(.light, fontSize: 14))
                                    .foregroundStyle(Color.subTitle)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 34)

                                HStack{
                                    TextField("Sajin Tamang", text: $name)
                                        .font(.customPoppinsfont(.regular, fontSize: 17))
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
                            
                            
                            //MARK: Email View
                            VStack(spacing: 20){
                                
                                Text("EMAIL ADDRESS")
                                    .font(.customYuGothicfont(.light, fontSize: 14))
                                    .foregroundStyle(Color.subTitle)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 34)

                                HStack{
                                    TextField("Email@Address. com", text: $email)
                                        .font(.customPoppinsfont(.regular, fontSize: 17))
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
                                    
                                    //MARK: Password show and hide View
                                    
                                    if(isShowPass) {
                                        TextField("******", text: $password)
                                            .font(.customPoppinsfont(.regular, fontSize: 17))
                                            .foregroundColor(Color.lightBlack2)
                                            .padding(.horizontal, 34)
                                            .autocapitalization(.none)
                                            .autocorrectionDisabled()
                                    }else{
                                        SecureField("******", text: $password)
                                            .font(.customPoppinsfont(.regular, fontSize: 17))
                                            .foregroundColor(Color.lightBlack2)
                                            .padding(.horizontal, 34)
                                            .autocapitalization(.none)
                                            .autocorrectionDisabled()
                                    }
                                    
                                    //MARK: Password show and hide button setup
                                    Button(action: {
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
                            
                            
                            //MARK: Sign In
                            
                            Button {
                                isNavigationActive = true
                                selectedDestination = .phoneNumber
                            } label: {
                                BigYellowButton(buttonTitle: "SIGN UP", isBold: true)
                                    .padding(.horizontal, 34)
                            }
                            
                            
                            Text("By Signing up you agree to our Terms Conditions & Privacy Policy.")
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .foregroundStyle(Color.subTitle)
                                .padding(.horizontal, 34)
                                .padding(.bottom, 20)
                            
                            VStack {
                                Text("Or")
                                    .font(.customYuGothicfont(.regular, fontSize: 17))
                                    .foregroundStyle(Color.lightBlack2.opacity(0.64))
                                
                                //MARK: facebook Button
                                
                                Button {
                                    print("facebook Button tapped")
                                } label: {
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
                                
                                Button {
                                    print("google Button tapped")
                                } label:{
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
    SignUp()
}
