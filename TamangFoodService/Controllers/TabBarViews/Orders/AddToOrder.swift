//
//  AddToOrder.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 08/08/2024.
//

import SwiftUI

struct AddToOrder: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    var restaurant: FeaturPartnerModel
    @State private var selectedTopCookie: String = "Chocolate Chip"
    @State private var selectedBottomCookie: String = "Red Velvet"
    let topCookie = [ "Chocolate Chip" , "Cookies and Cream", "Funfetti", "M and M " , "Red Velvet", "Peanut Butter", "Snickerdoodle", "White Chocolate Macadamia" ]
    
    @State var index = 0
    @State var quantity = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                ScrollView(showsIndicators: false){
                    Color.clear
                        .ignoresSafeArea(.all)
                    //MARK: Header view
                        ZStack {
                            Image("BG3")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                                .scaledToFill()
                            
                            HStack {
                                Button {
                                    mode.wrappedValue.dismiss()
                                } label : {
                                    Image("close")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                }
                                
                                Spacer()
                                
                            }.padding(.horizontal)
                                .offset(y: -60)
                        }
                    
                    VStack(spacing: 20) {
                        Text("Cookie Sandwich")
                            .font(.customYuGothicfont(.semiBold, fontSize: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 15)
                        
                        Text("Shortbread, chocolate turtle cookies, and red velvet. 8 ounces cream cheese, softened.")
                            .font(.customYuGothicfont(.regular, fontSize: 16))
                            .foregroundStyle(Color.lightBlack2.opacity(0.64))
                        
                        Text("$$  • \(restaurant.cuisines.joined(separator: " • "))")
                            .font(.customYuGothicfont(.regular, fontSize: 17))
                            .foregroundStyle(Color.subTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 24)
                    
                    //MARK: Choice of top Cookie
                    
                    
                    HStack (spacing: 25){
                        
                        Text("Choice of top Cookie")
                            .font(.customYuGothicfont(.light, fontSize: 20))
                            .foregroundColor(.lightBlack2)
                        
                        
                        Button { } label: {
                            Text("REQUIRED")
                                .font(.customPoppinsfont(.light, fontSize: 18))
                                .foregroundColor(Color.lightYellow2)
                                .frame(width: 130, height: 50, alignment: .center)
                                .background(Color(hex: "FFE5CC"))
                                .opacity(0.65)
                            
                        }
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 24)
                    
                  
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 15) {
                            ForEach(topCookie, id: \.self) { rest in
                                VStack {
                                    Button {
                                        selectedTopCookie = rest
                                    } label: {
                                        HStack {
                                            Image(selectedTopCookie == rest ? "ActiveOval" : "UnActiveOval")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                            
                                            Text(rest)
                                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                                .foregroundStyle(Color.lightBlack2.opacity(0.84))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 12)
                                        
                                    }
                                    Divider()
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 12)
                                        .padding(.trailing, -32)
                                }
                            }
                        }.padding(.horizontal)
                    }
                   
                    
                    
                    //MARK: Choice of Bottom Cookie
                    
                    
                    HStack (spacing: 15){
                        
                        Text("Choice of Bottom Cookie")
                            .font(.customYuGothicfont(.light, fontSize: 20))
                            .foregroundColor(.lightBlack2)
                        
                        
                        Button { } label: {
                            Text("REQUIRED")
                                .font(.customPoppinsfont(.light, fontSize: 18))
                                .frame(width: 130, height: 50, alignment: .center)
                                .foregroundColor(Color.lightYellow2)
                                .background(Color(hex: "FFE5CC"))
                                .opacity(0.65)
                            
                        }
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading, 14)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 15) {
                            ForEach(topCookie, id: \.self) { rest in
                                VStack {
                                    Button {
                                        selectedBottomCookie = rest
                                    } label: {
                                        HStack {
                                            Image(selectedBottomCookie == rest ? "ActiveOval" : "UnActiveOval")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                            
                                            Text(rest)
                                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                                .foregroundStyle(Color.lightBlack2.opacity(0.84))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 12)
                                    }
                                    
                                    Divider()
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 12)
                                        .padding(.trailing, -32)
                                }
                                
                            }
                        }.padding(.horizontal)
                    }
                    
                    //MARK: Add Special Instructions
                    
                    Spacer()
                        .frame(height: 35)
                    Button {} label: {
                        HStack {
                            Text("Add Special Instructions")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .foregroundStyle(Color.lightBlack2.opacity(0.74))
                            Spacer()
                            Image("forward")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .padding(.horizontal, 44)
                    }
                    Divider()
                        .foregroundStyle(Color.lightBlack2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 34)
                    
                    //MARK: set Quantity
                    
                    Spacer()
                        .frame(height: 35)
                    HStack {
                        Button {
                            if quantity >= 1 {
                                quantity -= 1
                            }
                        } label: {
                            Image("Minus")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                        }
                        
                        Text("\(quantity)")
                            .font(.customYuGothicfont(.semiBold, fontSize: 20))
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 15)
                        
                        Button {
                            quantity += 1
                        } label: {
                            Image("Plus")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                        }
                    }
                    
                    //MARK: Add to order
                    Spacer()
                        .frame(height: 35)
                    Button {
                        isNavigationActive = true
                        selectedDestination = .orderNow
                    } label: {
                        BigYellowButton(buttonTitle: "ADD TO ORDER ($11.98)", isBold: true)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, 34)
                    }
                    Spacer()
                        .frame(height: 25)

                }.padding(.top, -80)
            }
        }.edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    AddToOrder(restaurant: dummyFeatureRestaurants[0])
}





