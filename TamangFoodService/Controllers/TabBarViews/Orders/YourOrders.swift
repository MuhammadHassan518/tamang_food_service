//
//  YourOrders.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI

struct YourOrders: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var email: String = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    var featuredListMostPopuData : [FeaturedListModel]
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
                            .font(.customYuGothicfont(.semiBold, fontSize: 16))
                    }
                    
                    //MARK: All Views are here
                    
                    ScrollView(showsIndicators: false) {
                        //MARK: upcoming orders and clear button
                        Spacer()
                        HStack {
                            
                            Text("UPCOMING ORDERS")
                                .font(.customYuGothicfont(.light, fontSize: 16))
                                .foregroundStyle(Color.lightBlack)
                            
                            Spacer()
                            
                            Button {} label: {
                                Text("CLEAR ALL")
                                    .font(.customYuGothicfont(.light, fontSize: 16))
                                    .foregroundStyle(Color.lightBlack)
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        //MARK: Ordered Lists
                        ForEach(featuredListMostPopuData, id: \.id){ data in
                            UpcomingOrderLists(orderData: data)
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                isNavigationActive = true
                                selectedDestination = .confirmOrder(orderData: orderModelDummyData)
                            } label: {
                                Text("Proceed Payment")
                                    .font(.customYuGothicfont(.semiBold, fontSize: 18))
                                    .foregroundStyle(Color.lightYellow)
                            }
                        }.padding(.horizontal, 25)
                        
                        //MARK: PAST orders and clear button
                        Spacer()
                            .frame(height: 20)
                        HStack {
                            
                            Text("PAST ORDERS")
                                .font(.customYuGothicfont(.light, fontSize: 16))
                                .foregroundStyle(Color.lightBlack)
                            
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("CLEAR ALL")
                                    .font(.customYuGothicfont(.light, fontSize: 16))
                                    .foregroundStyle(Color.lightBlack)
                            }
                            
                        }.padding(.horizontal)
                        Spacer()
                            .frame(height: 20)
                        
                        
                        ForEach(featuredListMostPopuData, id: \.id){ data in
                            UpcomingOrderLists(orderData: data)
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
    YourOrders(featuredListMostPopuData: featuredListItemDummyDataMostPopular, orderData: orderModelDummyData)
}



