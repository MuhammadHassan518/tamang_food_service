//
//  AddSocialAccount.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 20/08/2024.
//

import SwiftUI

struct AddSocialAccount: View {
    
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
                        Text("Add Social Accounts")
                            .font(.customYuGothicfont(.semiBold, fontSize: 16))
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
                    
                    Spacer().frame(height: 100)
                    
                    ScrollView {
                        VStack (spacing: 20){
                            Text("Add Social Accounts")
                                .font(.customYuGothicfont(.semiBold, fontSize: 24))
                            
                            Text("Add your social accounts for more security. You will go directly to their site.")
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .foregroundStyle(Color.subTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 30)
                            
                            Spacer().frame(height: 10)
                            
                            HStack {
                                Button {
                                    mode.wrappedValue.dismiss()
                                } label: {
                                    HStack {
                                        Image("facebookSignIn")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal, 20)
                                        
                                        Text("CONNECT WITH FACEBOOK")
                                            .font(.customYuGothicfont(.semiBold, fontSize: 12))
                                            .foregroundColor(Color.white)
                                        Spacer()
                                    }.frame(maxWidth: .infinity, alignment: .center)
                                        .frame(height: 50)
                                        
                                }.background(Color.facebook)
                                    .cornerRadius(10.0)
                                    .padding(.horizontal, 34)
                                   
                            }
                            
                            HStack {
                                Button {
                                    mode.wrappedValue.dismiss()
                                } label: {
                                    HStack {
                                        Image("google")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal, 20)
                                        
                                        Text("CONNECT WITH GOOGLE")
                                            .font(.customYuGothicfont(.semiBold, fontSize: 12))
                                            .foregroundColor(Color.white)
                                        Spacer()
                                    }.frame(maxWidth: .infinity, alignment: .center)
                                        .frame(height: 50)
                                        
                                }.background(Color.google)
                                    .cornerRadius(10.0)
                                    .padding(.horizontal, 34)
                                   
                            }
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
    AddSocialAccount()
}
