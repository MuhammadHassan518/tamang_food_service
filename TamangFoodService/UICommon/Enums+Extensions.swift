//
//  Enums+Extensions.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI


enum Destination {
    case forgetPassword
    case signin
    case signup
    case home
    case forgetPass
    case resetEmail
    case phoneNumber
    case otpView
    case yourOrders
    case profileView
    case tabViewController
    case findNearestRestorent
    case findRestaurants(Restaurant: [FeaturPartnerModel])
    case singleRestaurants(Restaurant: [ReviewModel])
    case confirmOrder(orderData: [orderModel])
    case SearchRestaurants
    case featureResturents(isComingFrom: ComingFrom, title: String)
    case addToOrder
    case orderNow
    case addPaymentMethod
    case addSocialAccount
    case referToFriends
    case FilterScreen
    case scanCard
    case cardList(UserData: UserData)
    case donotHaveCard
    case changePassword
    case settingsScreen
    case browseFoods(Restaurant: [Restaurant])
    case searchFood(isComingFrom: ComingFrom)
    case searchView
    case resturentDetailView(restaurant: [FeaturPartnerModel], featuredListData: FeaturedListModel, featuredListMostPopuData: FeaturedListModel, featuredListSeaFoodData: FeaturedListModel, restData: Restaurant)
}


// Helper struct to contain the navigation logic
struct NavigationHelper {
    @ViewBuilder
    
    static func destinationView(for destination: Destination?) -> some View {
        switch destination {
        case .forgetPassword:
            ForgetPassScreen()
        case .signin:
            SignInScreen()
        case .signup:
            SignUp()
        case .home:
            TabViewController_Preview()
        case .forgetPass:
            ForgetPassScreen()
        case .resetEmail:
            ResetEmail()
        case .phoneNumber:
            PhoneNumber()
        case .otpView:
            OTPView()
        case .yourOrders:
            YourOrders(featuredListMostPopuData: featuredListItemDummyDataMostPopular, orderData: orderModelDummyData)
        case .profileView:
            ProfileView()
        case .findNearestRestorent:
            FindNearestRestaurants()  
        case .findRestaurants(let data):
            FindRestaurants(data: data)
        case .singleRestaurants(let reviewData):
            SingleResturent(data: reviewDummyData)
        case .confirmOrder(let orders):
            ConfirmOrder(orderData: orders)
        case .SearchRestaurants:
            SearchRestaurants(data: featuredListSearchDummyData)
        case .tabViewController:
            TabViewController_Preview()
        case .featureResturents(let isComingFrom, let title):
            FeaturePartners(data: dummyFeatureRestaurants, isComingFrom: isComingFrom, title: title)
        case .addToOrder:
            AddToOrder(restaurant: dummyFeatureRestaurants[0])
        case .orderNow:
            OrderNows(orderData: orderModelDummyData)
        case .addPaymentMethod:
            AddPaymentMethod()
        case .addSocialAccount:
            AddSocialAccount()
        case .referToFriends:
            ReferToFriends()
        case .FilterScreen:
            FilterScreen()
       case .scanCard:
                ScanCard()
        case .cardList(let userData):
            CardList(selectedCard: UserData(), onCardSelected: { selectedCard in })
        case .donotHaveCard:
            PaymentMethod()
        case .changePassword:
            PasswordChange()
        case .settingsScreen:
            ProfileSettings()
        case .browseFoods(let resturents):
            BrowseFoods(restaurants: resturents)
        case .searchFood(let isComingFrom):
            SeaarchFoods(isComingFrom: isComingFrom, data: featuredListSearchGategaryDummyData)
        case .searchView:
            SearchViewScreen()
        case .resturentDetailView:
            RestaurantDetailView(restData: dummyRestourents2, restaurant: dummyFeatureRestaurants[0], featuredListData: featuredListItemDummyData, featuredListMostPopuData: featuredListItemDummyDataMostPopular, featuredListSeaFoodData: featuredListItemDummyDataSeaFood)
        case .none:
            EmptyView()
        }
    }
}



enum ComingFrom {
    case searchView
    case featurePatner
}
