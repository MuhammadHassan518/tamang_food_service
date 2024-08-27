//
//  TamangFoodServiceApp.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 31/07/2024.
//

import SwiftUI

@main
struct TamangFoodServiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomeMainScreen()
            
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
