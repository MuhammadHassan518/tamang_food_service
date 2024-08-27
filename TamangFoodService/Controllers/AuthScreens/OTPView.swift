//
//  OTPView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI

struct OTPView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var otp: String = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    var body: some View {
        ZStack{

            NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                EmptyView()
            })
            
            VStack {
                //MARK: Navigation View
                ZStack{
                    Text("Login to Foodly")
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
                        
                        Spacer()
                    }
                }
                    .padding(.top, .topInsets + 8)
                    .padding(.horizontal, 20)
                
                ScrollView {
                    //MARK: Verify phone number View
                    VStack(spacing: 20){
                        Text("Verify phone number")
                            .font(.customYuGothicfont(.semiBold, fontSize: 25))
                            .foregroundColor(Color.lightBlack2)
                            .padding(.top, 30)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Enter the 4-Digit code sent to you at +610489632578")
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .foregroundColor(Color.lightBlack2.opacity(0.74))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 34)
                        .padding(.bottom, 24)
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        OTPTextField(txtOTP: $otp)
                            .foregroundColor(Color.lightBlack2)
                            .padding(.bottom, 30)
                        
                        //MARK: Continue Button View
                        
                        Button {
                            isNavigationActive = true
                            selectedDestination = .findNearestRestorent
                        } label: {
                            BigYellowButton(buttonTitle: "CONTINUE", isBold: true)
                                .font(.customYuGothicfont(.semiBold, fontSize: 18))
                        }
                        
                        //MARK: Didn’t receive code? View
                        
                        HStack {
                            Text("Didn’t receive code?")
                                .font(.customYuGothicfont(.light, fontSize: 14))
                                .foregroundColor(Color.lightBlack)
                                .padding(.horizontal, 4)
                            
                            Button(action: {
                                print("Button tapped")
                            }) {
                                Text("Resend Again.")
                                    .font(.customYuGothicfont(.light, fontSize: 14))
                                    .foregroundColor(Color.lightYellow)
                            }
                        }  .padding(.horizontal, 40)
                         
                        Text("By Signing up you agree to our Terms Conditions & Privacy Policy.")
                            .font(.customYuGothicfont(.light, fontSize: 17))
                            .foregroundColor(Color.lightBlack)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 24)
                    }
                    .foregroundColor(Color.lightBlack)
                    .padding(.horizontal, 20)
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    OTPView()
}
