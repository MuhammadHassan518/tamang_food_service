//
//  AddPaymentMethod.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 08/08/2024.
//

import SwiftUI

struct AddPaymentMethod: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var cardNumber = String()
    @State private var expiry = String()
    @State private var cvc = String()
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    //MARK: Back Button
                    Button {
                        mode.wrappedValue.dismiss()
                    } label : {
                        Image("back")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 24)
                    
                    
                    
                    ScrollView(showsIndicators: false){
                        
                        //MARK: Title and Cards fields
                        VStack {
                            Text("Add your payment methods")
                                .font(.customYuGothicfont(.semiBold, fontSize: 24))
                                .foregroundStyle(Color.lightBlack2)
                            
                            Text("This card will only be charged when you place an order.")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .foregroundStyle(Color.subTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 60)
                                .padding(.vertical)
                            
                            VStack (spacing: 25){
                                HStack {
                                    Image("card")
                                        .resizable()
                                        .frame(width: 35, height: 25, alignment: .leading)
                                        .padding(.horizontal, 30)
                                    Spacer()
                                    TextField("4343 4343 4343 4343", text: $cardNumber)
                                        .font(.customYuGothicfont(.regular, fontSize: 16))
                                        .foregroundStyle(Color.subTitle)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(Color(hex: "868686").opacity(0.103))
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10.0).inset(by: 0.5)
                                    .stroke(Color.lightGray))
                                
                                HStack {
                                    TextField("MM/YY", text: $expiry)
                                        .modifier(CardTextFieldModifier())
                                    
                                    Spacer()
                                    
                                    TextField("CVC", text: $cvc)
                                        .modifier(CardTextFieldModifier())
                                }
                            }
                            .padding(.horizontal, 30)
                            
                        }
                        
                        Spacer()
                            .frame(height: .screenHeight * 0.29)
                        
                        
                        //MARK: Bottom Add To card and Scan Card Button
                        
                        VStack (spacing: -15){
                            
                            Button {
                                isNavigationActive = true
                                selectedDestination = .donotHaveCard
                            } label: {
                                BigYellowButton(buttonTitle: "ADD TO CARD", isBold: true)
                                    .padding(.horizontal, 30)
                            }
                            
                            Button {
                                isNavigationActive = true
                                selectedDestination = .scanCard
                            } label: {
                                HStack {
                                    Image("camera")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                    
                                    Text("SCAN CARD")
                                        .font(.customYuGothicfont(.semiBold, fontSize: 15))
                                        .foregroundStyle(Color.lightBlack2)
                                    
                                }.frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(Color.lightGray))
                                    .padding(.horizontal, 30)
                            }
                        }
                    }.padding(.top)
                }
            }
        }.edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}
#Preview {
    AddPaymentMethod()
}

struct CardTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customYuGothicfont(.regular, fontSize: 16))
            .foregroundStyle(Color.subTitle)
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color(hex: "868686").opacity(0.103))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .inset(by: 0.5)
                    .stroke(Color.lightGray)
            )
    }
}
