//
//  SeaarchFoods.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 09/08/2024.
//

import SwiftUI


struct SeaarchFoods: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    var isComingFrom: ComingFrom
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
                    Button {
                        isNavigationActive = true
                        selectedDestination = .FilterScreen
                    } label: {
                        HStack {
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.gray)
                                .frame(width: 40, height: 40, alignment: .center)
                            
                            Text("Search")
                                .font(.customYuGothicfont(.semiBold, fontSize: 24))
                                .foregroundColor(Color.black)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        
                    }
                    
                    Text("Top Categories")
                        .font(.customYuGothicfont(.regular, fontSize: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.lightBlack2)
                        .padding(.horizontal, 24)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack {
                            LazyVGrid(columns: columns) {
                                ForEach(data, id: \.id) { food in
                                    Button {
                                        isNavigationActive = true
                                        selectedDestination = .resturentDetailView(restaurant: dummyFeatureRestaurants, featuredListData: featuredListItemDummyData[0], featuredListMostPopuData: featuredListItemDummyDataMostPopular[0], featuredListSeaFoodData: featuredListItemDummyDataSeaFood[0], restData: dummyRestourents[0])
                                    } label: {
                                        CategoryCard(restaurant: food)
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal)
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
    SeaarchFoods(isComingFrom: ComingFrom.searchView, data: featuredListSearchGategaryDummyData)
}
