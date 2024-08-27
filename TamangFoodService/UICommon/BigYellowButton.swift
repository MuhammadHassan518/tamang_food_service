//
//  BigYellowButton.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI

struct BigYellowButton: View {
    var buttonTitle : String = ""
    var isBold : Bool = false
    var body: some View {
           Text(buttonTitle).font(isBold ?.customYuGothicfont( .semiBold, fontSize: 17) : .customfaBrandsfont(.regular, fontSize: 17))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.lightYellow)
            .cornerRadius(10)
            .padding(.top, 0)
            .padding(.bottom, 30)
    }
}

#Preview {
    BigYellowButton()
}
