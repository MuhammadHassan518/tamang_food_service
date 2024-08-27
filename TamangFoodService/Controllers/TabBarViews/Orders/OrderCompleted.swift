//
//  OrderCompleted.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI

struct OrderCompleted: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @Binding var isPresented: Bool
    @State private var isNavigationActive = false

    var body: some View {
        NavigationView{
            ZStack {
                
                VStack {
                    
                    Text("You Place the Order \n Successfully")
                        .font(.customYuGothicfont(.light, fontSize: 20))
                        .foregroundStyle(Color.lightBlack2)
                        .frame(width: .infinity, height: 50, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Text("You placed the order successfully. You will get your food within 25 minutes. Thanks for using our services. Enjoy your food :)")
                        .font(.customYuGothicfont(.regular, fontSize: 16))
                        .foregroundStyle(Color.lightBlack)
                        .frame(width: .infinity, height: 70, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    
                    Button {
                        isPresented = false
                    } label: {
                        Text("KEEP BROWSING")
                            .font(.customYuGothicfont(.semiBold, fontSize: 14))
                            .foregroundStyle(Color.lightYellow2)
                            .shadow(color: Color(hex: "898181"), radius: 2, x: 0, y: 3)
                            .frame(width: .infinity, height: 20, alignment: .center)
                            .multilineTextAlignment(.center)
                    }
                    
                }
                .frame(width: .screenWidth - 30, height: 250)
                    .foregroundColor(Color.lightYellow2)
                    .background(Color(hex: "F8EDDC"))
                    .cornerRadius(20)
                
                Image("icon-done")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, -183)
                
            }.padding(.top, 20)
        } .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    OrderCompleted(isPresented: .constant(true))
}
