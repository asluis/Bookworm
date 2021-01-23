//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Luis Alvarez on 1/19/21.
//

import SwiftUI

@main
struct BookwormApp: App {
   let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
