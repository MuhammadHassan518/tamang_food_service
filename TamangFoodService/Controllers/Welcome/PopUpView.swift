//
//  PopUpView.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 10/09/2024.
//

import SwiftUI

struct PopUpView: View {
    @State private var showFilter = false
    @State private var selectedRating: Int = 0
    @State private var selectedOffers = "BURGERS"
    @State private var selectedDeliveryTime = "10-15 min"
    @State private var selectedPrRng = "$$"
    
    let offerType: [String] = ["Delivery", "Pick Up", "Offer", "Online payment available"]
    let deliveryTime: [String] = ["10-15 min", "20 min", "30 min"]
    let priceRange : [String] = ["$", "$$", "$$$"]

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Main screen content
                VStack {
                    Text("Restaurant View")
                        .font(.largeTitle)
                        .padding()
                    
                    // Example button to trigger the filter popup
                    Button(action: {
                        withAnimation {
                            showFilter.toggle()
                        }
                    }) {
                        Text("Show Filter")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .blur(radius: showFilter ? 3 : 0) // Blur background when filter is shown
                
                // Dimmed background when the popup is visible
                if showFilter {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showFilter.toggle() // Dismiss when tapping outside the popup
                            }
                        }
                }
                
                // The Filter View (popup)
                if showFilter {
                    filterPopupView()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7) // Adjust size for different devices
//                        .transition(.move(edge: .leading)) // Slide in from bottom
                }
            }
        }
    }
    
    // Filter Popup View
    func filterPopupView() -> some View {
        VStack(spacing: 20) {
            HStack {
                Text("Filter your search")
                    .font(.headline)
                    .padding()
                Spacer()
                Button(action: {
                    withAnimation {
                        showFilter.toggle() // Close button to dismiss
                    }
                }) {
                    Image(systemName: "xmark")
                        .padding()
                        .foregroundColor(.gray)
                }
            }
            
            // Filter Options
            VStack(alignment: .leading, spacing: 10) {
                Text("OFFERS")
                    .font(.subheadline)
                    .bold()
                
                
                VStack {
                    // First row with the first three items
                    HStack(spacing: 16) {
                        ForEach(offerType.prefix(3), id: \.self) { offer in
                            Button(action: {
                                selectedOffers = offer
                            }) {
                                Text(offer)
                                    .font(.customYuGothicfont(.semiBold, fontSize: 12))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 15)
                                    .foregroundColor(selectedOffers == offer ? .white : .black)
                                    .background(selectedOffers == offer ? Color.lightYellow2 : Color.white)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            .frame(maxWidth: .infinity) // Allow the button to take full width
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    HStack {
                        // Second row with the last item occupying full width
                        if let lastOffer = offerType.last {
                            Button(action: {
                                selectedOffers = lastOffer
                            }) {
                                Text(lastOffer)
                                    .font(.customYuGothicfont(.semiBold, fontSize: 12))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 15)
                                    .foregroundColor(selectedOffers == lastOffer ? .white : .black)
                                    .background(selectedOffers == lastOffer ? Color.lightYellow2 : Color.white)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .frame(maxWidth: .infinity) // Full-width button
                            }
                            .padding()
                        }
                    }.frame(maxWidth: .infinity)
                        .frame(alignment: .leading)
                    
                }
                
                
                Spacer()
                
                
                
                Text("DELIVERY TIME")
                    .font(.subheadline)
                    .bold()
               
                HStack {
                    ForEach(deliveryTime, id: \.self) { time in
                        Button(action: {
                            selectedDeliveryTime = time
                        }) {
                            Text(time)
                                .font(.customYuGothicfont(.semiBold, fontSize: 14))
                                .foregroundColor(Color(selectedDeliveryTime == time ? Color.white : Color.black))
                                .frame(width: 80, height: 35)
                                .background(selectedDeliveryTime == time ? Color.lightYellow2 :  Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .padding(.trailing, 5)
                        }
                    }
                }
                .padding(.horizontal)
                Spacer()
                
                
                Text("PRICING")
                    .font(.subheadline)
                    .bold()
                
                HStack{
                    ForEach(priceRange, id: \.self) { prcRag in
                        Button(action: {
                            selectedPrRng = prcRag
                        }) {
                            Text(prcRag)
                                .font(.customYuGothicfont(.semiBold, fontSize: 14))
                                .foregroundColor(Color(selectedPrRng == prcRag ? Color.white : Color.black))
                                .frame(width: 40, height: 40)
                                .background(selectedPrRng == prcRag ? Color.lightYellow2 :  Color.white)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                    }
                }
                Spacer()
                
                Text("RATING")
                    .font(.subheadline)
                    .bold()
                HStack {
                    ForEach(1..<6) { index in
                        Button(action: {
                            selectedRating = index
                        }) {
                            Image(systemName: index <= selectedRating ? "star.fill" : "star")
                                .foregroundColor(index <= selectedRating ? Color.yellow : Color.gray)
                        }
                        .buttonStyle(PlainButtonStyle()) // Remove default button styling if needed
                    }
                }
            }
            .padding(.horizontal)
            
            Button(action: {
                // Handle Filter action here
                withAnimation {
                    showFilter.toggle()
                }
            }) {
                Text("FILTER")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
    
    

}

#Preview {
    PopUpView()
}
