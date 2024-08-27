//
//  PaymentMethod.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI



struct PaymentMethod: View {
    @State private var selectedCard: CardData = CardData(name: "", imageName: "")
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?

    @StateObject private var userData = UserData()
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    
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
                    
                    if selectedCard.name != "" && selectedCard.imageName != "" {
                        
                        Button {
                            print(selectedCard.name)
                            isNavigationActive = true
                            selectedDestination = .confirmOrder(orderData: orderModelDummyData)
                        }label: {
                            ZStack {
                                Spacer().frame(height: 150)
                                
                                VStack {
                                    HStack {
                                        Image(selectedCard.name)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .padding(.horizontal)
                                            .padding(.bottom)
                                        VStack(spacing: 10) {
                                            
                                            Text(selectedCard.name)
                                                .font(.customYuGothicfont(.light, fontSize: 17))
                                                .foregroundStyle(Color.lightBlack2)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text("Deafult Payment")
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
                                        
                                        Image("checkMark")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    .padding(.horizontal, 24)
                                }
                            }
                        }
                        Spacer()
                    }else {
                        ScrollView(showsIndicators: false) {
                            
                            VStack(spacing: 20) {
                                
                                Image("Icon-Credit card")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .padding(.top, 70)
                                
                                Text("Don’t have any card \n:)")
                                    .font(.customYuGothicfont(.semiBold, fontSize: 24))
                                    .padding(.horizontal, 24)
                                    .multilineTextAlignment(.center)
                                
                                
                                Text("It’s seems like you have not added any credit or debit card. You may easily add card.")
                                    .font(.customYuGothicfont(.regular, fontSize: 17))
                                    .padding(.horizontal, 24)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.subTitle)
                                
                                
                                Button {
                                    // Navigation is now handled within the NavigationLink
                                } label: {
                                    NavigationLink(destination: CardList(
                                        selectedCard: UserData(),
                                        onCardSelected: { card in
                                            selectedCard = card // Update the selectedCard in PaymentMethod
                                        }
                                    )) {
                                        Text("ADD CREDIT CARDS")
                                            .foregroundStyle(Color.lightYellow)
                                            .font(.customYuGothicfont(.semiBold, fontSize: 14))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 40)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .inset(by: 0.5)
                                                    .stroke(Color.lightYellow)
                                            )
                                            .padding(.horizontal, 50)
                                            .padding(.vertical, 30)
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
}

#Preview {
    PaymentMethod()
}
