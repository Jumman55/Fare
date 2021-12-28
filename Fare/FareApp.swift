//
//  FareApp.swift
//  Fare
//
//  Created by Jumman Hossen on 01/12/21.
//

import SwiftUI

@main
struct FareApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isOnLoginPage") var  isOnLoginPage: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnLoginPage{
                LoginPageView()
            }else{
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
                
        }
    }
}
