//
//  RestaurantDetailView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 06/08/2024.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var restData : [ Restaurant ]
    var restaurant: FeaturPartnerModel
    var featuredListData: [FeaturedListModel]
    var featuredListMostPopuData: [FeaturedListModel]
    var featuredListSeaFoodData: [FeaturedListModel]
    var foodTypes = ["Beef & Lamb", "Seafood", "Appetizers", "Dim Sum"]
    
    @State var index = 0
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @State private var selectedFoodType: String = "Seafood"


    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                        EmptyView()
                    })
                    
                    ScrollView(showsIndicators: false){
                        //MARK: Header view
                        ZStack {
                            PagingView(index: $index.animation(), maxIndex: restData.count - 1) {
                                ForEach(self.restData) { imageName in
                                    //Image(imageName.images[index])
                                    Image(restData[2].images[index])
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .scaledToFill()
                                }
                            }
                            .aspectRatio(4/3, contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .cornerRadius(15)
                            
                            HStack {
                                Button {
                                    mode.wrappedValue.dismiss()
                                } label : {
                                    Image("backWhite")
                                        .resizable().frame(width: 40, height: 40)
                                }
                                
                                Spacer()
                                
                                Button { } label : {
                                    Image("share")
                                        .resizable().frame(width: 40, height: 40)
                                }
                                
                                Button { } label : {
                                    Image("search")
                                        .resizable().frame(width: 40, height: 40)
                                }
                                
                            }.padding(.horizontal, 24)
                                .offset(y: -60)
                            
                        }
                        
                        VStack(spacing: 20) {
                            Text("Mayfield Bakery & Cafe")
                                .font(.customYuGothicfont(.semiBold, fontSize: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 15)
                            
                            
                            Text("$$  • \(restaurant.cuisines.joined(separator: " • "))")
                                .font(.customYuGothicfont(.light, fontSize: 24))
                                .foregroundStyle(Color.lightBlack2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                isNavigationActive = true
                                selectedDestination = .singleRestaurants(Restaurant: reviewDummyData)
                            } label: {
                                
                                HStack{
                                    Text(restaurant.rating)
                                        .font(.customYuGothicfont(.light, fontSize: 16))
                                        .foregroundColor(.lightBlack2)
                                    
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.lightYellow2)
                                    
                                    Text(restData[0].numberOfRatings)
                                        .font(.customYuGothicfont(.light, fontSize: 16))
                                        .foregroundColor(.lightBlack2)
                                    
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                        }
                        .padding(.horizontal, 24)
                        
                        Spacer()
                        
                        HStack {
                            Image("YellowDollar")
                                .resizable()
                                .frame(width: 25, height: 25)
                                
                            Text("Free Delivery")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(width: 60)
                                .foregroundColor(.lightBlack2)
                            
                            
                            Image("YelloClock")
                                .resizable()
                                .frame(width: 25, height: 25)
                                
                            
                            Text(restaurant.deliveryTime + "utes")
                                .font(.customYuGothicfont(.light, fontSize: 15))
                                .frame(width: 65)
                                .foregroundColor(.lightBlack2)
                            
                            Button { } label: {
                                Text("TAKE AWAY")
                                    .font(.customYuGothicfont(.semiBold, fontSize: 18))
                                    .foregroundStyle(Color.lightYellow)
                                    .frame(width: 150, height: 50)
                                    .background(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color(red: 0.93, green: 0.65, blue: 0.20), lineWidth: 1.0))
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        //MARK: Featured Items view
                        
                        Text("Featured Items")
                            .font(.customYuGothicfont(.light, fontSize: 20))
                            .foregroundColor(Color.lightBlack2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 0) {
                                    ForEach(featuredListData, id: \.id) { rest in
                                        Button {
                                            isNavigationActive = true
                                            selectedDestination = .addToOrder
                                        } label: {
                                            FeaturedItemsList(data: rest)
                                    }
                                }
                            }
                        }
                        
                        //MARK: foodTypes scroller view
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(foodTypes, id: \.self){ foodtype in
                                    Button {
                                        selectedFoodType = foodtype
                                    } label : {
                                        Text(foodtype)
                                            .font(.customYuGothicfont(.semiBold, fontSize: 24))
                                            .foregroundColor(selectedFoodType == foodtype ? Color.lightBlack2 : Color.lightBlack)
                                            .padding()
                                    }
                                    
                                }
                            }
                        }
                        
                        //MARK: Most Populars view
                        
                        Text("Most Populars")
                            .font(.customYuGothicfont(.light, fontSize: 20))
                            .foregroundStyle(Color.lightBlack2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack (spacing: 15){
                                ForEach(featuredListMostPopuData, id: \.id) { data in
                                    Button {
                                        isNavigationActive = true
                                        selectedDestination = .addToOrder
                                    } label: {
                                        MostPopularList(data: data)
                                    }
                                }
                            }
                        }
                        
                        //MARK: Sea Foods view
                        
                        Text("Sea Foods")
                            .font(.customYuGothicfont(.light, fontSize: 20))
                            .foregroundStyle(Color.lightBlack2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack (spacing: 15){
                                ForEach(featuredListSeaFoodData, id: \.id) { data in
                                    Button {
                                        isNavigationActive = true
                                        selectedDestination = .addToOrder
                                    } label: {
                                        MostPopularList(data: data)
                                    }
                                }
                            }
                        }
                        
                    }.edgesIgnoringSafeArea(.all)
                        .padding(.bottom)
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
    RestaurantDetailView(restData: dummyRestourents, restaurant: dummyFeatureRestaurants[0], featuredListData: featuredListItemDummyData, featuredListMostPopuData: featuredListItemDummyDataMostPopular, featuredListSeaFoodData: featuredListItemDummyDataSeaFood)
}
