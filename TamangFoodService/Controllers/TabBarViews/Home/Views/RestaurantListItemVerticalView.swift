//
//  RestaurantListItemVerticalView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI

struct RestaurantListItemVerticalView: View {
    var restaurant: Restaurant
    @State var index = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            PagingView(index: $index.animation(), maxIndex: restaurant.images.count - 1) {
                ForEach(self.restaurant.images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .cornerRadius(15)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 180)
            
            
            Text(restaurant.name)
                .font(.customYuGothicfont(.light, fontSize: 20))
                .foregroundColor(Color.lightBlack2)
            
            Text("\(restaurant.price) • \(restaurant.cuisines.joined(separator: " • "))")
                .font(.customYuGothicfont(.regular, fontSize: 16))
                .foregroundColor(.subTitle)
            
            HStack {
                
                Text(restaurant.rating)
                    .font(.customYuGothicfont(.light, fontSize: 16))
                    .foregroundColor(.lightBlack2)
                
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.lightYellow)
                
                Text(restaurant.numberOfRatings)
                    .font(.customYuGothicfont(.light, fontSize: 14))
                    .foregroundColor(.lightBlack2)
                
                Spacer()
                
                Image(systemName: "clock.fill")
                    .resizable()
                    .frame(width: 17, height: 17)
                    .foregroundColor(.lightGray)
                    .colorMultiply(.gray)
                
                Text(restaurant.deliveryTime)
                    .font(.customYuGothicfont(.light, fontSize: 15))
                    .foregroundColor(.lightBlack2)
                
                Spacer()
                
                Image("Dollars")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.lightGray)
                    .colorMultiply(.gray)
                
                Text(restaurant.price)
                    .font(.customYuGothicfont(.light, fontSize: 15))
                    .foregroundColor(.lightBlack2)
            }
        }
//        .padding()
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
    }
}

#Preview {
    RestaurantListItemVerticalView(restaurant: dummyRestourents[0])
}
