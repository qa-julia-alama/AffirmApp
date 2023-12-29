//
//  AffirmAppApp.swift
//  AffirmApp
//
//  Created by Julia on 11/12/2023.
//

import SwiftUI

@main
struct AffirmAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
