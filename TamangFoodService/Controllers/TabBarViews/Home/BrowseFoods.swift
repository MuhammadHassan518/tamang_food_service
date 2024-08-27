//
//  BrowseFoods.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI

struct BrowseFoods: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @State var index = 0
    var restaurants : [ Restaurant ]
    
    var body: some View {
        NavigationView {
            ZStack{
                NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack{
                    //MARK: Navigation Bar
                    ZStack {
                        Text("DELIVERY TO")
                            .font(.customYuGothicfont(.semiBold, fontSize: 16))
                            .foregroundColor(.lightBlack2)
                        
                        HStack {
                            Button {
                                mode.wrappedValue.dismiss()
                            } label : {
                                Image("back")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            Spacer()
                        }.padding(.horizontal, 20)
                    }
                    
                    ScrollView {
                        
                        VStack(spacing: 15) {
                            ForEach(restaurants) { rest in
                                Button {
                                    isNavigationActive = true
                                    selectedDestination = .addToOrder
                                } label: {
                                    RestaurantListItemVerticalView(restaurant: rest)
                                }
                            }
                        }
                    }
                }
            }
        }
            .edgesIgnoringSafeArea(.all)
               .navigationTitle("")
               .navigationBarBackButtonHidden()
               .navigationBarHidden(true)
               .ignoresSafeArea()
        
    }
}

#Preview {
    BrowseFoods(restaurants: dummyRestourents)
}
