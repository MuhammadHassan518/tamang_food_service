//
//  SingleResturent.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 20/08/2024.
//

import SwiftUI

struct SingleResturent: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    var data: [ReviewModel]
    
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
                            HStack {
                                Image("LocationMarker")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                
                                Text("Hay Street , Perth")
                                    .font(.customYuGothicfont(.regular, fontSize: 17))
                                
                            }.frame( maxWidth: .infinity, alignment: .leading)
                            
                            Spacer().frame(height: 10)
                            
                            Divider()
                                
                            Spacer().frame(height: 10)
                            
                            HStack {
                                Text("Ratings & Reviews")
                                    .font(.customYuGothicfont(.light, fontSize: 20))
                                    .frame( maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color.black)
                                
                                Button {} label: {
                                    Text("See all")
                                        .foregroundColor(Color.lightYellow)
                                        .font(.customYuGothicfont(.light, fontSize: 16))
                                }
                            }
                            
                            ForEach(data) { review in
                                
                                VStack(spacing: 15) {
                                    HStack {
                                        Image(review.userImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 30, height: 30)
                                        
                                        Text(review.name)
                                            .font(.customYuGothicfont(.light, fontSize: 18))
                                        
                                        ZStack {
                                            Text(review.rating)
                                                .foregroundColor(Color.white)
                                        }
                                        .frame(width: 50, height: 30)
                                        .background(Color.lightYellow2)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        
                                    }.frame( maxWidth: .infinity, alignment: .leading)
                                        .padding(.top, 15)
                                    
                                    Text(review.comment)
                                        .font(.customYuGothicfont(.regular, fontSize: 16))
                                        .foregroundStyle(Color.lightBlack2.opacity(0.64))
                                    
                                    if review.resturtImages.count > 0 {
                                        ScrollView(.horizontal){
                                            HStack {
                                                ForEach(review.resturtImages, id: \.self) { review2 in
                                                    Image(review2)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 80, height: 80, alignment: .leading)
                                                        .cornerRadius(5.0)
                                                        .clipped()
                                                        .padding(.trailing, 2)
                                                }
                                            }
                                        }
                                    }
                                }.frame( maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.horizontal, 34)
                        .padding(.top, 15)
                        .background(Color.white)
                    }
                    
                    
                    HStack(spacing: -10) {
                        RoundButton(title: "BROWSE FOOD") {
                            isNavigationActive = true
                            selectedDestination = .browseFoods(Restaurant: dummyRestourents)
                        }.padding(.horizontal, 0)
                        
                        
                        Button {} label : {
                            Image("forwardShare")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .frame(width: 60, height: 50)
                        .background(Color.lightGray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.lightGray, lineWidth: 1.0))
                        .cornerRadius(5.0)
                        .padding(.trailing)
                    }.frame(height: 50)
                    
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
    SingleResturent(data: reviewDummyData)
}
