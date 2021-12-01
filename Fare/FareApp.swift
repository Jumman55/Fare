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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
