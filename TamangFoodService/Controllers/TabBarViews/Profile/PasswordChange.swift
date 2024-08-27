//
//  PasswordChange.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI

struct PasswordChange: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var password: String = ""
    @State private var isShowPass = false
    @State private var isShowNewPass = false
    @State private var isShowConfPass = false
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
                        
                        //MARK: Password
                        
                        VStack(spacing: 15){
                            
                            Text("PASSWORD")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.subTitle)
                                .padding(.horizontal, 34)
                            
                            HStack{
                                
                                if(isShowPass) {
                                    TextField("******", text: $password)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled()
                                }else{
                                    SecureField("******", text: $password)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled()
                                }
                                
                                
                                Button(action: {
                                    print("Eyes opened")
                                    isShowPass.toggle()
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
                        }.padding(.horizontal, 24)
                            Spacer().frame(height: 15)
                        
                        //MARK: New Password
                        
                        VStack(spacing: 15){
                            
                            Text("NEW PASSWORD")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.subTitle)
                                .padding(.horizontal, 34)
                            
                            HStack{
                                
                                if(isShowNewPass) {
                                    TextField("******", text: $newPassword)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled()
                                }else{
                                    SecureField("******", text: $newPassword)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled()
                                }
                                
                                
                                Button(action: {
                                    print("Eyes opened")
                                    isShowNewPass.toggle()
                                }, label: {
                                    Image(isShowNewPass ? "openEye" : "closeEye")
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
                        }.padding(.horizontal, 24)
                            Spacer().frame(height: 15)
                        
                        //MARK: Confirm Password
                        
                        VStack(spacing: 15){
                            
                            Text("CONFIRM PASSWORD")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.subTitle)
                                .padding(.horizontal, 34)
                            
                            HStack{
                                
                                if(isShowConfPass) {
                                    TextField("******", text: $confirmPassword)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled()
                                }else{
                                    SecureField("******", text: $confirmPassword)
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.lightBlack2)
                                        .padding(.horizontal, 34)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled()
                                }
                                
                                
                                Button(action: {
                                    isShowConfPass.toggle()
                                }, label: {
                                    Image(isShowConfPass ? "openEye" : "closeEye")
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
                        }.padding(.horizontal, 24)
                            Spacer().frame(height: 15)
                        
                    }
                    
                        RoundButton(title: "CHANGE PASSWORD") {
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
    PasswordChange()
}
