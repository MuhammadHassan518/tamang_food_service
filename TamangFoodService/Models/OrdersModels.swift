//
//  OrdersModels.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 08/08/2024.
//

import Foundation
import SwiftUI


struct orderModel: Identifiable, Equatable {
    var id: Int
    var productName: String
    var productPrice: String
    var productDiscrp: String
    var productQuantity: String
    
    init(id: Int, productName: String, productPrice: String, productDiscrp: String, productQuantity: String) {
        self.id = id
        self.productName = productName
        self.productPrice = productPrice
        self.productDiscrp = productDiscrp
        self.productQuantity = productQuantity
    }
    
    static func ==(lhs: orderModel, rhs: orderModel) -> Bool {
        lhs.id == rhs.id
    }
    
}

let orderModelDummyData = [

orderModel(id: 1, productName: "Cookie Sandwich", productPrice: "AUD$10", productDiscrp: "Shortbread, chocolate turtle cookies, and red velvet.", productQuantity: "1"),
orderModel(id: 2, productName: "Combo Burger", productPrice: "AUD$10", productDiscrp: "Shortbread, chocolate turtle cookies, and red velvet.", productQuantity: "5"),
orderModel(id: 3, productName: "Oyster Dish", productPrice: "AUD$10", productDiscrp: "Shortbread, chocolate turtle cookies, and red velvet.", productQuantity: "2"),
orderModel(id: 4, productName: "Cookie Sandwich", productPrice: "AUD$10", productDiscrp: "Shortbread, chocolate turtle cookies, and red velvet.", productQuantity: "3")
]



