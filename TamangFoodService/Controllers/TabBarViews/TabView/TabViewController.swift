//
//  TabView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import SwiftUI

struct TabViewController: View {
    @Binding var selectedTab: Int

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(tutorials: dummymageSlider, restaurants: dummyRestourents, restaurants2: dummyRestourents2)
                .tabItem {
                    Label("", image: selectedTab == 0 ? "HomeSelected" : "Home")
                }
                .tag(0)

            SearchRestaurants(data: featuredListSearchDummyData)
                .tabItem {
                    Label("", image: selectedTab == 1 ? "SearchSelected" : "Search")
                }
                .tag(1)

            YourOrders(featuredListMostPopuData: featuredListItemDummyDataMostPopular, orderData: orderModelDummyData)
                .tabItem {
                    Label("", image: selectedTab == 2 ? "OrdersSelected" : "Orders")
                }
                .tag(2)

            ProfileView()
                .tabItem {
                    Label("", image: selectedTab == 3 ? "ProfileSelected" : "Profile")
                }
                .tag(3)
        }
    }
}

struct TabViewController_Preview: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabViewController(selectedTab: $selectedTab)
    }
}

#Preview {
    ContentView()
}
