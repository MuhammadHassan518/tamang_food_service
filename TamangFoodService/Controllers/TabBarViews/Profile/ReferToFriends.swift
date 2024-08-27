//
//  ReferToFriends.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 20/08/2024.
//

import SwiftUI

struct Person: Identifiable {
    let id : Int
    let name: String
    let job: String
    let imageName: String
}

struct ReferToFriends: View {
    @State private var referLik: String = "https://ui8.net/7673"
    @State private var showingShareSheet = false
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    
    let people: [Person] = [
        Person(id: 0, name: "Jane", job: "iPhone X", imageName: "profile"),
        Person(id: 1, name: "Paul", job: "MacBook Pro", imageName: "profile"),
        Person(id: 2, name: "Natalia", job: "iPad", imageName: "profile"),
        Person(id: 3, name: "Susie", job: "iPhone 8 Plus", imageName: "profile")
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
                        Text("Refer To Friends")
                            .font(.customYuGothicfont(.semiBold, fontSize: 18))
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
                        
                        VStack(spacing: 20) {
                            
                            Image("Icon-Credit card")
                                .resizable()
                                .frame(width: 130, height: 130)
                                .padding(.top, 70)
                               
                            Text("Refer a Friend, Get $10")
                                .font(.customYuGothicfont(.semiBold, fontSize: 24))
                                .padding(.horizontal, 24)
                                .multilineTextAlignment(.center)
                            
                            
                            Text("Get $10 in credits when someone sign up using your refer link")
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .padding(.horizontal, 24)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.subTitle)
                            
                            
                            Button {
                                showingShareSheet.toggle()
                                mode.wrappedValue.dismiss()
                            } label: {
                                HStack {
                                    Image("forwardShare")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(.horizontal)
                                    
                                    Text("https: //ui8.net/7673")
                                        .font(.customYuGothicfont(.regular, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                    
                                }
                            }.frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.lightWhite)
                                .cornerRadius(10.0)
                                .padding(.horizontal, 60)
                                .padding(.vertical, 30)
                            
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
    ReferToFriends()
}
