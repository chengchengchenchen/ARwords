//
//  BackendApp.swift
//  Backend
//
//  Created by Ihsiao Huang on 2023/6/9.
//

import SwiftUI

@main
struct BackendApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
