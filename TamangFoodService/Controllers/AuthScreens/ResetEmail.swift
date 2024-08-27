//
//  ResetEmail.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI

struct ResetEmail: View {
    
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
                            .foregroundStyle(Color.lightBlack2)
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
                            Text("Reset email sent")
                                .font(.customYuGothicfont(.light, fontSize: 35))
                                .foregroundStyle(Color.lightBlack2)
                                .padding(.top, 30)
                            
                            
                            VStack(alignment: .leading) {
                                Text("We have sent a instructions email to")
                                    .font(.customYuGothicfont(.regular, fontSize: 15))
                                    .foregroundColor(Color.subTitle)
                                
                                HStack {
                                    Text("sajintamang @figma.com.")
                                        .font(.customYuGothicfont(.regular, fontSize: 15))
                                        .foregroundColor(Color.subTitle)
                                        .padding(.horizontal, 2)
                                    
                                    
                                    Button(action: {
                                        onBtnVavigate()
                                        selectedDestination = .phoneNumber
                                    }) {
                                        Text("Having roblem?")
                                            .font(.customYuGothicfont(.regular, fontSize: 15))
                                            .foregroundColor(Color.lightYellow)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 34)
                            .padding(.bottom, 24)
                            
                            
                            
                            //MARK: Sign In
                            
                            Button(action: {
                                
                            }, label: {
                                BigYellowButton(buttonTitle: "SEND AGAIN", isBold: true)
                                    .padding(.horizontal, 34)
                            })
                            
                            Image("forgetPassword")
                                .resizable()
                                .frame(width: 300, height: 300)
                                .padding(.bottom, 50)
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
    
    func onBtnVavigate() {
        isNavigationActive = true
    }
}

#Preview {
    ResetEmail()
}
