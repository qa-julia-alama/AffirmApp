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
    @Published var shouldShowGoToSettings: Bool = false
    
    func saveUsername(_ name: String) {
        UserDefaults.standard.setValue(name, forKey: Constans.username)
    }
    
    func setupWelcome() {
        UserDefaults.standard.setValue(false, forKey: Constans.shouldShowWelcome)
    }
    
    func askForPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.notificationManager.askForPermission()
            case .denied: ()
                DispatchQueue.main.async {
                    self.shouldShowGoToSettings = true
                }
            case .authorized, .provisional, .ephemeral:
                return
            default:
                self.notificationManager.askForPermission()
            }
        }
    }

    func cancelNotifications() {
        notificationManager.cancelScheduledNotification()
    }
    
    func shouldShowNotification(_ status: Bool) {
        notificationManager.shouldShowNotification(status)
    }
    
    func checkToggle(completion: @escaping () -> Void) {
        notificationManager.isNotificationPermissionGranted(completion: { granted in
          self.shouldShowNotification(granted)
            completion()
        })
      }
}
