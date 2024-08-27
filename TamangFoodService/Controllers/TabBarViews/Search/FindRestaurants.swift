//
//  FindRestaurants.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 20/08/2024.
//

import SwiftUI

struct FindRestaurants: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @State private var selectedCategory = "BURGERS"
    @State private var selectedDietry = "ANY"
    @State private var selectedPrRng = "$$"
    
    let categories: [String] = ["BURGERS", "BRUNCH", "BREAKFAST"]
    
    var data: [FeaturPartnerModel]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
  var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
            
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack {
                            
                            Image("mapView")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, alignment: .top)
                                .frame(height: 280)
                                .ignoresSafeArea()
                            
                            HStack {
                                Button {
                                    mode.wrappedValue.dismiss()
                                } label: {
                                    Image("Icon-back")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                }
                                
                                Spacer()
                                
                                Button {
                                    mode.wrappedValue.dismiss()
                                } label: {
                                    Image("icon-search")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                }
                            }.offset(y: -100)
                        }
                        VStack {
                            Spacer().frame(height: 20)
                            
                            Text("Top Pick Restaurants")
                                .font(.customYuGothicfont(.semiBold, fontSize: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Spacer()
                                .frame(height: 30)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                ForEach(categories, id: \.self) { category in
                                    Button(action: {
                                        selectedCategory = category
                                    }) {
                                        Text(category)
                                            .font(.customYuGothicfont(.semiBold, fontSize: 12))
                                            .foregroundColor(Color(selectedCategory == category ? Color.lightYellow2 : Color.black))
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(selectedCategory == category ? Color(hex: "FFE5CC").opacity(0.5) : Color.gray.opacity(0.21))
                                            .cornerRadius(20)
                                    }
                                }
                            }
                            
                            Spacer()
                                .frame(height: 30)
                            
                            Divider()
                                .frame( maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                LazyVGrid(columns: columns) {
                                    ForEach(data, id: \.id) { restaurant in
                                        
                                        Button {
                                            selectedDestination = .resturentDetailView(restaurant: dummyFeatureRestaurants, featuredListData: featuredListItemDummyData[0], featuredListMostPopuData: featuredListItemDummyDataMostPopular[0], featuredListSeaFoodData: featuredListItemDummyDataSeaFood[0], restData: dummyRestourents[0])
                                            isNavigationActive = true
                                        }label: {
                                            FetureRestLisView(data: restaurant)
                                        }
                                    }
                                }
                            }
                            
                            
                            
                        }.padding()
                            .background(Color.white)
                            .cornerRadius(50)
                    }
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
    FindRestaurants(data: dummyFeatureRestaurants)
}
