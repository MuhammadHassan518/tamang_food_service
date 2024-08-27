//
//  RoundButton.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 09/08/2024.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customYuGothicfont(.semiBold, fontSize: 20))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50 )
        .background( Color.lightYellow)
        .cornerRadius(20)
        .padding(34)
    }
}

#Preview {
    RoundButton()
        
}
