//
//  WelcomeViewModel.swift
//  AffirmApp
//
//  Created by Julia on 02/02/2024.
//

import Foundation
import UserNotifications

final class WelcomeViewModel: ObservableObject {
    let notificationManager = NotificationManager.shared
    
    func saveUsername(_ name: String) {
        UserDefaults.standard.setValue(name, forKey: "username")
    }
    
    func setupWelcome() {
        UserDefaults.standard.setValue(false, forKey: "shouldShowWelcome")
    }
    
    func askForPermission() {
        notificationManager.askForPermission()
    }

    func shouldShowNotification(_ status: Bool) {
        notificationManager.shouldShowNotification(status)
    }
}
