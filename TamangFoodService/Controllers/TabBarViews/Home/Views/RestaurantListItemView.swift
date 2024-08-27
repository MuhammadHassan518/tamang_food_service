//
//  RestaurantListItemView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI

struct RestaurantListItemView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 190, height: 150)
                .cornerRadius(10)
                .clipped()
            
            Text(restaurant.name)
                .font(.customYuGothicfont(.light, fontSize: 20))
                .foregroundStyle(Color.lightBlack2)
               
            Text(restaurant.location)
                .font(.customYuGothicfont(.regular, fontSize: 16))
                .foregroundColor(.lightBlack)
                .padding(.vertical, 01)
            HStack {
                Text(restaurant.rating)
                    .font(.customYuGothicfont(.semiBold, fontSize: 13))
                    .foregroundStyle(Color.white)
                    .padding(6)
                    .background(Color.lightYellow2)
                    .cornerRadius(8)
                
                Text(restaurant.deliveryTime)
                    .font(.customYuGothicfont(.light, fontSize: 15))
                    .foregroundColor(.lightBlack2)
                
                Text("•")
                    .font(.customYuGothicfont(.light, fontSize: 30))
                    .foregroundColor(.subTitle)
                
                Text(restaurant.deliveryType)
                    .font(.customYuGothicfont(.light, fontSize: 14))
                    .foregroundColor(.lightBlack2)
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    RestaurantListItemView(restaurant: dummyRestourents[0])
}
