//
//  ScanCard.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 20/08/2024.
//

import SwiftUI

struct ScanCard: View {
    
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack {
                
                NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                Image("scanner")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea()
                 Image("Overlay")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack {
                    
                    //MARK: Navigation View
                    ZStack{
                       
                        HStack {
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("backWhite")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .colorMultiply(Color.white)
                            }
                            .foregroundColor(.white)
                            .offset(x: 30)
                            Spacer()
                        }
                    }
                    
                    
                    
                    Spacer().frame(height: 100)
                    
                    
                    Text("Scan Your Card:)")
                        .foregroundStyle(Color.white)
                        .frame(width: .infinity, height: 40, alignment: .leading)
                        .font(.customYuGothicfont(.semiBold, fontSize: 24))
                    
                    Text("Just my luck, no ice. Must go faster. Did he just throw my cat out of the window")
                        .frame(width: .infinity, height: 60, alignment: .leading)
                        .font(.customYuGothicfont(.regular, fontSize: 17))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
        } .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    ScanCard()
}
