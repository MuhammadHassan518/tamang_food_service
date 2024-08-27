//
//  SearchViewScreen.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 13/08/2024.
//

import SwiftUI

struct SearchViewScreen: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @State private var txtSearch = ""
   
    var isComingFrom = ComingFrom.searchView

    let categories: [String] = ["Subway", "Burgers", "Sandwich", "Piza", "Fried Rice with meat", "Bakery", "Cake", "Cookies", "Chiken"]
    @State private var searchCategories: [String] = []
    
    
    var body: some View {
        NavigationView{
            ZStack {
                NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    //MARK: Navigation View
                    
                    HStack {
                        Button {} label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.black)
                                .frame(width: 40, height: 40, alignment: .center)
                        }
                        
                        TextField("Search", text: $txtSearch)
                            .font(.customYuGothicfont(.semiBold, fontSize: 28))
                            .foregroundColor(Color.black)
                            .onChange(of: txtSearch) { oldValue, newValue in
                                if txtSearch.isEmpty {
                                    searchCategories = categories
                                } else {
                                    searchCategories = categories.filter {$0.contains(txtSearch)}
                                }
                            }
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                                .font(.customYuGothicfont(.regular, fontSize: 16))
                                .foregroundColor(Color.lightBlack2.opacity(0.84))
                                .frame(width: 100, height: 40, alignment: .center)
                        }
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                                            
                    //MARK: Category Header View
                    
                    ScrollView {
                        
                        Spacer().frame(height: 30)
                        HStack {
                            Text("RECENTS SEARCHES")
                                .font(.customYuGothicfont(.light, fontSize: 16))
                                .foregroundColor(Color.lightBlack2)
                                .foregroundStyle(Color.lightBlack)
                            
                            Spacer()
                            
                            Button {
                            } label: {
                                Text("CLEAR ALL")
                                    .font(.customYuGothicfont(.light, fontSize: 16))
                                    .foregroundStyle(Color.lightBlack2)
                            }
                        }.padding(.horizontal, 34)
                        Spacer().frame(height: 30)
                        
                        
                        ForEach(searchCategories, id: \.self) { category in
                            Button(action: {
                                isNavigationActive = true
                                selectedDestination = .featureResturents(isComingFrom: .searchView, title: category)
                            }) {
                                HStack {
                                    
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color.black)
                                        .frame(width: 20, height: 20, alignment: .topLeading)
                                    
                                    Text(category)
                                        .font(.customYuGothicfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.lightBlack2)
                                }
                            }
                        }.frame(maxWidth: .infinity, alignment: .topLeading)
                            .frame(height: 40)
                            .padding(.horizontal, 34)
                    }
                }
            }
        }.onAppear(perform: {
            searchCategories = categories
        })
        .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}
#Preview {
    SearchViewScreen(isComingFrom: ComingFrom.searchView)
}
