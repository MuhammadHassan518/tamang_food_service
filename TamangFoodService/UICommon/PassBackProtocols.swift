//
//  PassBackProtocols.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 20/08/2024.
//

import Foundation
import UIKit
import SwiftUI


protocol PassBackProtocols {
    func passCard(cardName: String)
}

class UserData: ObservableObject {
    @Published var cardData: CardData = CardData(name: "", imageName: "")
}
