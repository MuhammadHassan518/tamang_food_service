//
//  FilterScreen.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 09/08/2024.
//

import SwiftUI

struct FilterScreen: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @State private var selectedCategory = "BURGERS"
    @State private var selectedDietry = "ANY"
    @State private var selectedPrRng = "$$"
    
    let categories: [String] = ["ALL", "BRUNCH", "DINNER", "BURGERS", "CHINESE", "PIZZA", "SALADS", "SOUPS", "BREAKFAST"]
    
    let dietries = ["ANY", "VEGETARIAN", "VEGAN", "GLUTEN-FREE"]
    
    let priceRange : [String] = ["$", "$$", "$$$", "$$$$", "$$$$$", "$$$$$$"]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            ZStack {
                NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    //MARK: Navigation View
                    
                    ZStack {
                        Text("Filters")
                            .font(.customYuGothicfont(.semiBold, fontSize: 18))
                        HStack{
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("back")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.horizontal, 24)
                                Spacer()
                            }
                        }
                    }
                    
                    //MARK: Category Header View
                    
                    ScrollView {
                        
                        Spacer()
                            .frame(height: 30)
                        
                        HStack {
                            Text("CATEGORIES")
                                .font(.customYuGothicfont(.light, fontSize: 16))
                                .foregroundStyle(Color.lightBlack2)
                            
                            Spacer()
                            
                            Button {
                            } label: {
                                Text("CLEAR ALL")
                                    .font(.customYuGothicfont(.light, fontSize: 13))
                                    .foregroundStyle(Color.lightBlack2)
                            }
                        }.padding(.horizontal, 34)
                        
                        Spacer()
                            .frame(height: 30)
                        //MARK: Grid of category buttons
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(categories, id: \.self) { category in
                                Button(action: {
                                    selectedCategory = category
                                }) {
                                    Text(category)
                                        .font(.customYuGothicfont(.semiBold, fontSize: 13))
                                        .foregroundColor(Color(selectedCategory == category ? Color.white : Color.black))
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        
                                        .background(selectedCategory == category ? Color.lightYellow2 : Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 34)
                        
                        //MARK: Grid of Dietry buttons
                        
                        Spacer().frame(height: 30)
                        HStack {
                            Text("DIETARY")
                                .font(.customYuGothicfont(.light, fontSize: 16))
                                .foregroundStyle(Color.lightBlack2)
                            
                            Spacer()
                            
                            Button {
                            } label: {
                                Text("CLEAR ALL")
                                    .font(.customYuGothicfont(.light, fontSize: 13))
                                    .foregroundStyle(Color.lightBlack2)
                            }
                        }.padding(.horizontal, 34)
                        Spacer().frame(height: 30)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(dietries, id: \.self) { dietry in
                                Button(action: {
                                    selectedDietry = dietry
                                }) {
                                    Text(dietry)
                                        .font(.customYuGothicfont(.semiBold, fontSize: 12))
                                        .foregroundColor(Color(selectedDietry == dietry ? Color.white : Color.black))
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(selectedDietry == dietry ? Color.lightYellow2 : Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 34)
                        Spacer()
                        
                        //MARK: Grid of price range buttons
                        
                        Spacer().frame(height: 30)
                        HStack {
                            Text("PRICE RANGE")
                                .font(.customYuGothicfont(.light, fontSize: 16))
                                .foregroundStyle(Color.lightBlack2)
                            
                            Spacer()
                            
                            Button {
                            } label: {
                                Text("CLEAR ALL")
                                    .font(.customYuGothicfont(.light, fontSize: 13))
                                    .foregroundStyle(Color.lightBlack2)
                            }
                        }.padding(.horizontal, 34)
                        Spacer().frame(height: 30)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(priceRange, id: \.self) { prcRag in
                                Button(action: {
                                    selectedPrRng = prcRag
                                }) {
                                    Text(prcRag)
                                        .font(.customYuGothicfont(.semiBold, fontSize: 14))
                                        .foregroundColor(Color(selectedPrRng == prcRag ? Color.white : Color.black))
                                        .padding()
                                        .frame(width: 80, height: 80)
                                        .background(selectedPrRng == prcRag ? Color.lightYellow2 : Color.gray.opacity(0.2))
                                        .cornerRadius(40)
                                }
                            }
                        }
                        .padding(.horizontal, 34)
                        Spacer().frame(height: 120)
                        
                        Button {
                            isNavigationActive = true
                            selectedDestination = .searchView
                        } label: {
                            BigYellowButton(buttonTitle: "APPLY FILTERS", isBold: true)
                                .padding(.horizontal, 30)
                        }
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
    FilterScreen()
}






