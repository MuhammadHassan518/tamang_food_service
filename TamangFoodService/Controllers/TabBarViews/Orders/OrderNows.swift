//
//  SwiftUIView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 08/08/2024.
//

import SwiftUI

struct OrderNows: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var email: String = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    var orderData: [orderModel]
    
    
    var body: some View {
        NavigationView{
            ZStack {
                
                NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    
                    //MARK: Navigation View
                    
                    ZStack{
                        Text("Your Orders")
                            .font(.customYuGothicfont(.semiBold, fontSize: 17))
                        HStack {
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("whitecClose")
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
                        
                        Spacer()
                            .frame(height: 25)
                        
                        //MARK: Ordered Lists
                        
                        ForEach(orderData, id: \.id){ data in
                            OrdersList(orderData: data)
                        }
                        
                        //MARK:  Subtotal View

                        HStack {
                            Text("Subtotal")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.lightBlack2)
                                .padding(.horizontal, 34)
                            
                            Text("AUD$30")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .foregroundStyle(Color.lightBlack2)
                                .padding(.trailing)
                        }.padding(.top, 20)
                        
                        //MARK:  Delivery View
                        
                        HStack {
                            
                            Text("Delivery")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.lightBlack2)
                                .padding(.horizontal, 34)
                            
                            Text("AUD$0")
                                .font(.customYuGothicfont(.semiBold, fontSize: 16))
                                .foregroundStyle(Color.lightBlack2)
                                .padding(.trailing)
                        }.padding(.top, 10)

                        //MARK:  last price view
                        
                        HStack {
                            
                            Text("")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 34)
                            
                            Text("AUD$30")
                                .font(.customYuGothicfont(.semiBold, fontSize: 15))
                                .foregroundStyle(Color.lightYellow2)
                                .padding(.trailing)
                        }.padding(.top, 10)
                        
                        //MARK:  add more items

                        Spacer()
                            .frame(height: 25)
                        Button {} label: {
                            HStack {
                                Text("Add more items")
                                    .font(.customYuGothicfont(.light, fontSize: 16))
                                    .foregroundStyle(Color.lightYellow2)
                                Spacer()
                                Image("forward")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .padding(.horizontal, 24)
                        }
                        Divider()
                            .foregroundStyle(Color.lightBlack2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24)
                        
                        //MARK:  promo View

                        Spacer()
                            .frame(height: 25)
                        Button {} label: {
                            HStack {
                                Text("Promor code")
                                    .font(.customYuGothicfont(.light, fontSize: 16))
                                    .foregroundStyle(Color.lightBlack2.opacity(0.64))
                                Spacer()
                                Image("forward")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .padding(.horizontal, 24)
                        }
                        Divider()
                            .foregroundStyle(Color.lightBlack2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24)
                        
                    //MARK:  CONTINUE (AUD $30)
                        Spacer()
                            .frame(height: 35)
                        Button(action: {
                            isNavigationActive = true
                            selectedDestination = .addPaymentMethod
                        }, label: {
                            BigYellowButton(buttonTitle: "CONTINUE (AUD $30)", isBold: true)
                                .padding(.horizontal, 34)
                        })
                        
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
    OrderNows(orderData: orderModelDummyData)
}


//MARK: ordered list UI Design

struct OrdersList: View {
    var orderData: orderModel
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image("squareBox")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(orderData.productQuantity)
                        .font(.customYuGothicfont(.light, fontSize: 18))
                        .foregroundStyle(Color.lightYellow2)

                }
                
                Text(orderData.productName)
                    .font(.customYuGothicfont(.light, fontSize: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.lightBlack2)

                
                Text(orderData.productPrice)
                    .font(.customYuGothicfont(.semiBold, fontSize: 15))
                    .foregroundStyle(Color.lightYellow)
                    .padding(.trailing)
                
                
            }.padding(.horizontal)
            
            Text(orderData.productDiscrp)
                .font(.customYuGothicfont(.regular, fontSize: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 55)
                .foregroundStyle(Color.lightBlack2.opacity(0.64))
            Spacer()
                .frame(height: 15)
            Divider()
                .padding(.horizontal, 30)
        }
    }
}
