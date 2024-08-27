//
//  UpcomingOrderLists.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI

struct UpcomingOrderLists: View {
    var orderData: FeaturedListModel
    
    var body: some View {
        VStack {
            HStack {
                Image(orderData.imageName)
                        .resizable()
                        .frame(width: 110, height: 110)

                VStack(spacing: 12) {
                    
                    Text(orderData.name)
                        .font(.customPoppinsfont(.light, fontSize: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.lightBlack2)
                    
                    Text(orderData.address)
                        .font(.customPoppinsfont(.regular, fontSize: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.lightBlack2.opacity(0.64))
                   
                    HStack {
                        
                        Text("$$ • \(orderData.cuisines.joined(separator: " • "))")
                            .font(.customPoppinsfont(.regular, fontSize: 16))
                            .foregroundStyle(Color.lightBlack2.opacity(0.74))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Text(orderData.price)
                            .font(.customPoppinsfont(.semiBold, fontSize: 15))
                            .foregroundStyle(Color.lightYellow)
                            .padding(.trailing)
                    }
                }
            }.padding(.horizontal)
        }
        
        Spacer()
            .frame(height: 25)
    }
}

#Preview {
    UpcomingOrderLists(orderData: featuredListItemDummyData[0])
}
