//
//  ProfileView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI

struct notifData {
    var title : String
    var isOn : Bool
}

struct ProfileView: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var isPushNoti = true
    @State private var isSmsNoti = false
    @State private var isPromotNoti = true
    @State private var selectedDestination: Destination?
    
    @State private var notifDataList = [
        notifData(title: "Push Notifications",  isOn: true),
        notifData(title: "SMS Notifications", isOn: false),
        notifData(title: "Promotional Notifications", isOn: true)
    ]
    
    
    var body: some View {
        NavigationView{
            ZStack {
                
                NavigationLink( destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                    EmptyView()
                })
                
                VStack {
                    
                    //MARK: Navigation View
                    Text("Account Settings")
                        .font(.customYuGothicfont(.semiBold, fontSize: 28))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 30)
                    
                    //MARK: All Views are here
                    
                    ScrollView(showsIndicators: false) {
                        
                        Text("Update your settings like notifications, payments, profile edit etc.")
                            .font(.customYuGothicfont(.regular, fontSize: 17))
                            .foregroundStyle(Color.subTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24)
                        
                        Spacer()
                            .frame(height: 25)
                        
                        
                        //MARK: Profile view
                        Button {
                            print("Profile Clicked")
                            isNavigationActive = true
                            selectedDestination = .settingsScreen
                        } label: {
                            HStack {
                                Image("profile")
                                    .resizable()
                                    .frame(width: 30, height: 35)
                                    .padding(.horizontal)
                                
                                VStack(spacing: 10) {
                                    
                                    Text("Profile Information")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.lightBlack2)
                                    
                                    Text("Change your account information")
                                        .font(.customYuGothicfont(.regular, fontSize: 15))
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
                        
                        
                        //MARK: Change Password view
                        Button {
                            print("Change Password")
                            isNavigationActive = true
                            selectedDestination = .settingsScreen
                        } label: {
                            HStack {
                                Image("lock")
                                    .resizable()
                                    .frame(width: 30, height: 35)
                                    .padding(.horizontal)
                                
                                VStack(spacing: 10) {
                                    
                                    Text("Change Password")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Change Password")
                                        .font(.customYuGothicfont(.regular, fontSize: 15))
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
                        
                        
                        //MARK: Profile view
                        Button {
                            print("Payments Methods")
                            isNavigationActive = true
                            selectedDestination = .addPaymentMethod
                        } label: {
                            HStack {
                                Image("card")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(.horizontal)
                                
                                VStack(spacing: 10) {
                                    
                                    Text("Payments Methods")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Add your credit & debit cards")
                                        .font(.customYuGothicfont(.regular, fontSize: 15))
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
                        
                        
                        //MARK: Location view
                        Button {
                            print("Location Clicked")
                        } label: {
                            HStack {
                                Image("LocationMarker")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                                    .padding(.horizontal)
                                
                                VStack(spacing: 10) {
                                    
                                    Text("Locations")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Add or remove your delivery locations")
                                        .font(.customYuGothicfont(.regular, fontSize: 15))
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
                        
                        
                        //MARK: Add Social Account view
                        Button {
                            print("Add Social Account Clicked")
                            isNavigationActive = true
                            selectedDestination = .addSocialAccount
                        } label: {
                            HStack {
                                Image("facebook")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                                    .padding(.horizontal)
                                
                                VStack(spacing: 10) {
                                    
                                    Text("Add Social Account")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Add Facebook, Twitter etc ")
                                        .font(.customYuGothicfont(.regular, fontSize: 15))
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
                        
                        
                        //MARK: Refer to Friends view
                        Button {
                            print("Refer to Friends Clicked")
                            isNavigationActive = true
                            selectedDestination = .referToFriends
                        } label: {
                            HStack {
                                Image("share")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.horizontal)
                                    .colorMultiply(Color(hex: "010F07"))
                                
                                VStack(spacing: 10) {
                                    
                                    Text("Refer to Friends")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Get $10 for reffering friends")
                                        .font(.customYuGothicfont(.regular, fontSize: 15))
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
                        
                        
                        
                        //MARK:  NOTIFICATIONS View
                        
                        Text("NOTIFICATIONS")
                            .font(.customYuGothicfont(.semiBold, fontSize: 18))
                            .foregroundStyle(Color.lightBlack2.opacity(0.74))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(25)
                        
                       
                        VStack {
                            //MARK: Push Notifications view
                            
                            ForEach($notifDataList, id: \.title) { $notif in
                                    HStack {
                                        Image("notify")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal)
                                            .colorMultiply(Color(hex: "010F07"))
                                        
                                        VStack(spacing: 10) {
                                            
                                            Text(notif.title)
                                                .font(.customYuGothicfont(.light, fontSize: 17))
                                                .foregroundStyle(Color.lightBlack2)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text("For daily update you will get it")
                                                .font(.customYuGothicfont(.regular, fontSize: 15))
                                                .foregroundStyle(Color.lightBlack2.opacity(0.54))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Spacer()
                                                .frame(height: 2)
                                            Divider()
                                                .foregroundStyle(Color.lightBlack2)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.trailing, -36)
                                        }
                                        
                                        CustomToggle(isOn: $notif.isOn)
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 20)
                                    }
                                    .padding(.horizontal, 24)
                                }
                            }
                        
                        //MARK:  NOTIFICATIONS View
                        
                        Text("MORE")
                            .font(.customYuGothicfont(.semiBold, fontSize: 18))
                            .foregroundStyle(Color.lightBlack2.opacity(0.74))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(25)
                        
                       
                        //MARK: Rate us view
                        Button {
                            print("Rate us Clicked")
                        } label: {
                            HStack {
                                Image("rating")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                                    .padding(.horizontal)
                                    
                                
                                VStack(spacing: 10) {
                                    Text("Rate Us")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Rate Us playstore, appstore")
                                        .font(.customYuGothicfont(.light, fontSize: 15))
                                        .foregroundStyle(Color.lightBlack.opacity(0.54))
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
                        
                        
                        //MARK: FAQ view
                        Button {
                            print("FAQ Clicked")
                        } label: {
                            HStack {
                                Image("document")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                                    .padding(.horizontal)
                                    
                                
                                VStack(spacing: 10) {
                                    
                                    Text("FAQ")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Frequently asked questions")
                                        .font(.customYuGothicfont(.light, fontSize: 15))
                                        .foregroundStyle(Color.lightBlack.opacity(0.54))
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
                        
                        
                        
                        //MARK: Logout view
                        Spacer()
                            .frame(height: 20)
                        Button {
                            print("Logout Clicked")
                            isNavigationActive = true
                            selectedDestination = .signin
                        } label: {
                            HStack {
                                Image("logout")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.horizontal)
                                
                                VStack {
                                    
                                    Text("logout")
                                        .font(.customYuGothicfont(.light, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Spacer()
                                        .frame(height: 20)
                                    
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
            }.padding(.top, 20)
        } .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
}
