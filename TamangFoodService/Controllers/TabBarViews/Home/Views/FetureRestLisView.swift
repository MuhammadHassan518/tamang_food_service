//
//  FEtureRestLisView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 06/08/2024.
//

import SwiftUI

struct FetureRestLisView: View {
    var data : FeaturPartnerModel
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    
    var body: some View {
    NavigationView {
        ZStack {
            VStack {
                ZStack {
                    Image(data.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170, height: 330)
                        .cornerRadius(10)
                    
                    VStack {
                        HStack{
                            Image("fast-delivery")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                            
                            Text(data.deliveryTime)
                                .font(.customYuGothicfont(.regular, fontSize: 12))
                                .foregroundStyle(Color.white)
                            
                        }.padding(.trailing, 85)
                        
                        HStack{
                            Image("Dollars")
                                .resizable()
                                .frame(width: 16, height: 16)
                            
                            Text(data.delivery)
                                .font(.customYuGothicfont(.regular, fontSize: 12))
                                .foregroundStyle(Color.white)
                            
                            
                            Spacer()
                            
                            Text(data.rating)
                                .font(.customYuGothicfont(.semiBold, fontSize: 12))
                                .padding(6)
                                .background(Color.lightYellow)
                                .cornerRadius(8)
                                .foregroundStyle(Color.white)
                        }
                        .frame(width: .screenWidth / 2 - 60, height: 30)
                    }.padding(.top, .screenHeight / 2 - 200)
                }
                
                Text(data.name)
                    .font(.customYuGothicfont(.light, fontSize: 20))
                    .foregroundStyle(Color.lightBlack2)
                    
                Text("\(data.cuisines.joined(separator: " • "))")
                    .font(.customYuGothicfont(.regular, fontSize: 16))
                    .foregroundStyle(Color.subTitle)
                    .padding(1)
            }.padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    FetureRestLisView(data: dummyFeatureRestaurants[0])
}
