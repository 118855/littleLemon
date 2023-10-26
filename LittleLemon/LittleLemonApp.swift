//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    @StateObject var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .environmentObject(userManager)
        }
    }
}
