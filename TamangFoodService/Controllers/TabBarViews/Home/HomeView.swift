//
//  HomeView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI


struct HomeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var index = 0
    @State private var txtAddress: String = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    var tutorials: [TutorialModel]
    var restaurants : [ Restaurant ]
    var restaurants2 : [ Restaurant ]
    
    var body: some View {
        ZStack{
            
            NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                EmptyView()
            })
            
            VStack {
                //MARK: Navigation Bar
                ZStack {
                    VStack {
                        Text("DELIVERY TO")
                            .font(.customYuGothicfont(.light, fontSize: 14))
                            .foregroundColor(.lightYellow)
                            .padding(.top, 30)
                        ZStack {
                            Button {
                            } label : {
                                HStack {
                                    Text("HayStreet, Perth")
                                        .font(.customYuGothicfont(.light, fontSize: 20))
                                        .foregroundColor(.lightBlack2)
                                    
                                    Image("back")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .rotationEffect(.init(degrees: 270))
                                }
                            }
                            
                            Button {
                                isNavigationActive = true
                                selectedDestination = .FilterScreen
                            } label : {
                                Text("Filter")
                                    .foregroundColor(Color.lightBlack2)
                                    .font(.customYuGothicfont(.light, fontSize: 20))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 30)
                            }
                        }
                    }
                }.frame(height: 30)
                
                Divider()
                    .frame(maxWidth: .infinity, maxHeight: 1.2)
                    .foregroundColor(Color.lightBlack)
                    .padding(.top, 30)
                
                ScrollView(showsIndicators: false) {
                    //MARK: Page Slider
                    
                    PagingView(index: $index.animation(), maxIndex: tutorials.count - 1) {
                        ForEach(self.tutorials) { imageName in
                            Image(imageName.image)
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(15)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .aspectRatio(2.3, contentMode: .fit)
                    .padding(.horizontal, 20)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .cornerRadius(15)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    //MARK: Feature Patners Title View
                    HStack {
                        Text("Featured Partners")
                            .font(.customYuGothicfont(.semiBold, fontSize: 24))
                            .foregroundColor(Color.lightBlack2)
                            .padding(.leading, 30)
                            .frame(width: 150)
                        Spacer()
                        Button {
                            isNavigationActive = true
                            selectedDestination = .featureResturents(isComingFrom: ComingFrom.featurePatner, title: "Featured Partners")
                        }label: {
                            Text("See all")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .foregroundStyle(Color.lightYellow)
                                .padding(.trailing, 30)
                        }
                    }
                    
                    //MARK: Feature Patners List View
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: -10) {
                            ForEach(restaurants) { rest in
                                Button {
                                    isNavigationActive = true
                                    selectedDestination = .addToOrder
                                } label: {
                                    RestaurantListItemView(restaurant: rest)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)

                    Spacer()
                        .frame(height: 15)
                    
                    //MARK: Promotion Banners
                    ZStack {
                        Image("Banner")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 24)
                            .clipped()
                        
                        VStack {
                            
                            Text("Free Delivery for \n1 Month!")
                                .font(.customYuGothicfont(.semiBold, fontSize: 28))
                            
                            Spacer()
                            
                            Text("You’ve to order at least $l0 for\nusing free delivery for 1 month")
                                .font(.customYuGothicfont(.regular, fontSize: 15))
                        }
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 50)
                        .padding(.vertical)
                    }
                    
                    
                    
                    Spacer()
                        .frame(height: 15)
                    
                    //MARK:  Best Picks Restaurants heading view
                    HStack {
                        Text("Best Picks Restaurants by team")
                            .font(.customYuGothicfont(.semiBold, fontSize: 24))
                            .foregroundColor(Color.lightBlack2)
                            .padding(.leading, 24)
                            .frame(width: 200)
                        
                        Spacer()
                        
                        Button {
                            isNavigationActive = true
                            selectedDestination = .findRestaurants(Restaurant: dummyFeatureRestaurants)
                        }label: {
                            Text("See all")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .foregroundStyle(Color.lightYellow)
                                .padding(.trailing, 30)
                        }
                    }
                    
                    //MARK:  Best Picks Restaurants by team List View
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(restaurants2) { rest in
                                Button {
                                    isNavigationActive = true
                                    selectedDestination = .addToOrder
                                } label: {
                                    RestaurantListItemView(restaurant: rest)
                                        .frame(width: 220)
                                        .padding(.vertical, 10)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    
                    
                    //MARK: All Restaurants heading view
                    HStack {
                        Text("All Restaurants")
                            .font(.customYuGothicfont(.semiBold, fontSize: 22))
                            .frame(width: 150)
                        Spacer()
                        Button {
                            isNavigationActive = true
                            selectedDestination = .findRestaurants(Restaurant: dummyFeatureRestaurants)
                        }label: {
                            Text("See all")
                                .font(.customYuGothicfont(.light, fontSize: 18))
                                .foregroundStyle(Color.lightYellow)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                    
                    //MARK: All Restaurants list view
                    
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
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
    
    func onBtnVavigate() {
        isNavigationActive = true
    }
}

#Preview {
    HomeView(tutorials: dummymageSlider, restaurants: dummyRestourents, restaurants2: dummyRestourents2)
}

