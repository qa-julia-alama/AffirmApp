//
//  AffirmAppApp.swift
//  AffirmApp
//
//  Created by Julia on 11/12/2023.
//

import SwiftUI

@main
struct AffirmAppApp: App {
    @AppStorage("shouldShowWelcome") var shouldShowWelcome: Bool = true
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if shouldShowWelcome {
                WelcomeView()
            } else if shouldShowOnboarding {
               OnboardingView()
            } else {
                TabContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
