//
//  CardList.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI

struct CardData {
    var name: String
    var imageName: String
}

struct CardList: View {
    @ObservedObject var selectedCard: UserData
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    var onCardSelected: (CardData) -> Void
    
    var cardList = [
    CardData(name: "PayPal", imageName: "Paypal"),
    CardData(name: "MasterCard", imageName: "MasterCard"),
    CardData(name: "Visa", imageName: "Visa")
    ]
    
    var body: some View {
        NavigationView{
            ZStack {
                
                NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    
                    //MARK: Navigation View
                    ZStack{
                        Text("Payment Methods")
                            .font(.customYuGothicfont(.semiBold, fontSize: 17))
                        HStack {
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("back")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            .foregroundColor(.white)
                            .offset(x: 30)
                            Spacer()
                        }
                    }
                    
                    //MARK: All Views are here
                    
                    ScrollView(showsIndicators: false) {
                        
                        ForEach(cardList, id: \.name ) { card in
                            
                            VStack(spacing: 20) {
                                
                                Spacer().frame(height: 10)
                                Button {
                                    print("\(card.name) Clicked")
                                    selectedCard.cardData.name = card.name
                                    selectedCard.cardData.imageName = card.imageName
                                    self.onCardSelected(selectedCard.cardData)
                                    mode.wrappedValue.dismiss()
                                } label: {
                                    VStack {
                                        HStack {
                                            
                                            Image(card.imageName)
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .padding(.horizontal)
                                                .padding(.bottom)
                                            
                                            VStack(spacing: 10) {
                                                
                                                Text(card.name)
                                                    .font(.customYuGothicfont(.light, fontSize: 17))
                                                    .foregroundStyle(Color.lightBlack2)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Text(card.name == "PayPal" ? "Deafult Payment" : "Not Deafult" )
                                                    .font(.customYuGothicfont(.light, fontSize: 15))
                                                    .foregroundStyle(Color.lightBlack2.opacity(0.54))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Spacer()
                                                    .frame(height: 2)
                                                
                                                Divider()
                                                    .foregroundStyle(Color.lightBlack2)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .padding(.trailing, -36)
                                            }
                                            
                                            Image("forward")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        .padding(.horizontal, 24)
                                    }
                                }
                            }
                        }
                    }
                }
            }.padding(.top, 20)
        } .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
    
//    private func cardItemView(name: String, imageName: String) -> some View {
//        VStack {
//            HStack {
//                Image(imageName)
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .padding(.horizontal)
//                    .padding(.bottom)
//                VStack(spacing: 10) {
//                    Text(name)
//                        .font(.customYuGothicfont(.light, fontSize: 17))
//                        .foregroundStyle(Color.lightBlack2)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    Text("Default Payment")
//                        .font(.customYuGothicfont(.light, fontSize: 15))
//                        .foregroundStyle(Color.lightBlack)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    
//                    Spacer()
//                        .frame(height: 2)
//                    Divider()
//                        .foregroundStyle(Color.lightBlack2)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.trailing, -36)
//                }
//                Image("forward")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//            }
//            .padding(.horizontal, 24)
//        }
//    }
}

#Preview {
    CardList(selectedCard: UserData(), onCardSelected: { selectedCard in
            print("Selected card: \(selectedCard.name)")
        })
}
