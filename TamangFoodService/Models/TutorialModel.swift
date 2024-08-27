//
//  TutorialModel.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 31/07/2024.
//

import Foundation
import SwiftUI

// Assuming this is in a file like TutorialModel.swift
struct TutorialModel: Identifiable, Equatable {
    var id: Int = 0
    var title: String = ""
    var image: String = ""
    var message: String = ""
    
    init(id: Int, title: String, image: String, message: String) {
        self.id = id
        self.title = title
        self.image = image
        self.message = message
    }
    
    static func == (lhs: TutorialModel, rhs: TutorialModel) -> Bool {
        return lhs.id == rhs.id
    }
}
//private let images = ["welcomeFaverite", "welcomeChoseFood", "welcomeDelivery"]

// Dummy Data
let dummyTutorials: [TutorialModel] = [
    TutorialModel(id: 0,
                  title: "All your favorites",
                  image: "welcomeFaverite",
                  message: "Order from the best local restaurants with easy, on-demand delivery."),
    
    TutorialModel(id: 1,
                  title: "Free delivery offers",
                  image: "welcomeDelivery",
                  message: "Free delivery for new customers via Apple Pay and others payment methods."),
    
    TutorialModel(id: 2,
                  title: "Choose your food",
                  image: "welcomeChoseFood",
                  message: "Easily find your type of food craving and you’ll get delivery in wide range.")
]


let dummymageSlider: [TutorialModel] = [
    TutorialModel(id: 0,
                  title: "",
                  image: "BG1",
                  message: ""),
    
    TutorialModel(id: 1,
                  title: "",
                  image: "BG2",
                  message: ""),
    
    TutorialModel(id: 2,
                  title: "",
                  image: "BG3",
                  message: ""),


    TutorialModel(id: 3,
                  title: "",
                  image: "BG4",
                  message: ""),
    
    TutorialModel(id: 4,
                  title: "",
                  image: "BG5",
                  message: ""),
    
    TutorialModel(id: 5,
                  title: "",
                  image: "BG6",
                  message: ""),
    
    TutorialModel(id: 6,
                  title: "",
                  image: "BG7",
                  message: ""),
    
    TutorialModel(id: 7,
                  title: "",
                  image: "BG8",
                  message: "")


]
