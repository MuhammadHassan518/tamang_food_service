//
//  FeaturedItemsList.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 06/08/2024.
//

import SwiftUI

struct FeaturedItemsList: View {
    var data : FeaturedListModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Image(data.imageName)
                    .resizable()
                    .frame(width: 140, height: 140)
                    .cornerRadius(3.0)
                    
                Text(data.name)
                    .font(.customYuGothicfont(.regular, fontSize: 16))
                    .foregroundStyle(Color.lightBlack2)

                Text("$$ • \(data.cuisines[0])")
                    .font(.customYuGothicfont(.regular, fontSize: 14))
                    .foregroundStyle(Color.lightBlack2)

            }.frame(maxWidth: .infinity, alignment: .leading)
               .padding(.horizontal, 10)
        }
    }
}

#Preview {
    FeaturedItemsList(data: featuredListItemDummyData[0])
}
