//
//  MostPopularList.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 06/08/2024.
//

import SwiftUI

struct MostPopularList: View {
    var data : FeaturedListModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 10){
                    
                    Image(data.imageName)
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(3.0)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(data.name)
                            .font(.customYuGothicfont(.light, fontSize: 18))
                            .foregroundStyle(Color.lightBlack2)
                        
                        Text(data.address)
                            .font(.customYuGothicfont(.regular, fontSize: 18))
                            .foregroundStyle(Color.lightBlack2.opacity(0.64))
                        
                        HStack {
                            Text("$$ \(data.cuisines[0])")
                                .font(.customYuGothicfont(.regular, fontSize: 14))
                                .foregroundStyle(Color.lightBlack2.opacity(0.8))
                            
                            Spacer()
                            
                            Text(data.price)
                                .font(.customYuGothicfont(.semiBold, fontSize: 16))
                                .foregroundStyle(Color.lightYellow)
                            
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    MostPopularList(data: featuredListItemDummyData[0])
}
