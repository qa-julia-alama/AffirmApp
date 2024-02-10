//
//  SettingsViewModel.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import Foundation
import UserNotifications

final class SettingsViewModel: ObservableObject {
    @Published var shouldShowGoToSettings: Bool = false
    
    let notificationManager = NotificationManager.shared
    
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
    
    func isNotificationPermissionGranted() -> Bool {
        notificationManager.isNotificationPermissionGranted()
    }
}


