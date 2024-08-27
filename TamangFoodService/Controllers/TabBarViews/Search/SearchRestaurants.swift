//
//  SearchRestaurants.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI

struct SearchRestaurants: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    var data : [FeaturedListModel]
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
                    //MARK: Search View for Header
                    CustomSearchView()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack {
                            LazyVGrid(columns: columns) {
                                ForEach(data, id: \.id) { food in
                                    Button {
                                        isNavigationActive = true
                                        selectedDestination = .resturentDetailView(restaurant: dummyFeatureRestaurants, featuredListData: featuredListItemDummyData[0], featuredListMostPopuData: featuredListItemDummyDataMostPopular[0], featuredListSeaFoodData: featuredListItemDummyDataSeaFood[0], restData: dummyRestourents[0])
                                    } label: {
                                        RestaurantCard(restaurant: food)
                                    }
                                }
                            }
                        }
                    }.padding(.vertical)
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
    SearchRestaurants(data: featuredListSearchDummyData)
}

struct CustomSearchView: View {
    @State private var searchText = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Search")
                .font(.customPoppinsfont(.semiBold, fontSize: 28))
                .foregroundColor(Color.lightBlack2)
            
            HStack {
                Button {
                    isNavigationActive = true
                    selectedDestination = .findRestaurants(Restaurant: dummyFeatureRestaurants)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.lightBlack)
                        .padding(.leading, 16)
                }
                
                TextField("Search on foodly", text: $searchText)
                    .foregroundColor(Color.lightGray)
                    .padding(.leading, 20)
            }
            .frame(height: 48)
            .background(Color.rgbToColor(r: 251, g: 251, b: 251))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.rgbToColor(r: 134.37, g: 134.37, b: 134.37, a: 0.1), lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity)
        .frame(height: 88)
        .padding(.horizontal, 24)
    }
}
