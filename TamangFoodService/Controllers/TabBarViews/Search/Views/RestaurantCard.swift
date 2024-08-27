//
//  RestaurantCard.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 07/08/2024.
//

import SwiftUI

struct RestaurantCard: View {
    var restaurant: FeaturedListModel
    
    var body: some View {
        VStack(spacing: 10) {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 140)
                .cornerRadius(8)
            
            Text(restaurant.name)
                .font(.customYuGothicfont(.light, fontSize: 16))
                .foregroundColor(.lightBlack2)
            
                
                Text("$$  • \(restaurant.cuisines.joined(separator: " • "))")
                .font(.customYuGothicfont(.light, fontSize: 15))
                .foregroundColor(.lightBlack2)

        }
        .frame(width: 180, height: 198)
        .background(Color.white)
    }
}


struct CategoryCard: View {
    var restaurant: FeaturedListModel
    
    var body: some View {
        VStack{
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 140)
                .cornerRadius(8)
        }
        .frame(width: 160, height: 150)
        .background(Color.white)
    }
}




#Preview {
    RestaurantCard(restaurant: featuredListSearchDummyData[0])
}
