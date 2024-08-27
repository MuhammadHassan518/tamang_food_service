//
//  FindNearestRestaurants.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI

struct FindNearestRestaurants: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var txtAddress: String = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?

    
    var body: some View {
        ZStack{
            NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                EmptyView()
            })
            
            VStack {
                //MARK: Navigation View
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image("whitecClose")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, .topInsets + 20)
                .padding(.horizontal, 20)
                
                ScrollView {
                    //MARK: Heading View
                    VStack(spacing: 20){
                        Text("Find restaurants near you")
                            .font(.customYuGothicfont(.semiBold, fontSize: 24))
                            .padding(.top)
                            .foregroundColor(Color.lightBlack2)
                        
                            Text("Please enter your location or allow access to your location to find restaurants near you.")
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .foregroundColor(Color.subTitle)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 24)
                        
                        }
                      
                    //MARK: use current location button View
                        Button {
                           isNavigationActive = true
                            selectedDestination = .tabViewController
                        } label: {
                            HStack {
                                Image("locationYellow")
                                    .foregroundColor(.lightYellow)
                                
                                Text("Use current location")
                                    .font(.customYuGothicfont(.regular, fontSize: 17))
                                    .foregroundColor(Color.lightYellow2)
                            }
                        }.frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.lightYellow, lineWidth: 1.5)
                            )
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                        
                    //MARK: use textfield location View
                    
                        HStack {
                            Image("LocationMarker")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.horizontal, 15)
                            
                            TextField("Enter a new Address", text: $txtAddress)
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .foregroundColor(Color.lightBlack2)

                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.lightGray, lineWidth: 0.5)
                        )
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.lightBlack)
                    .padding(.horizontal, 30)
                }
                
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    FindNearestRestaurants()
}
