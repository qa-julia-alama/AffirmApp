//
//  SettingsViewModel.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    let notificationManager = NotificationManager.shared
    
    func shouldShowNotification(_ status: Bool) {
        notificationManager.shouldShowNotification(status)
    }
    
    func askForPermission() {
        notificationManager.askForPermission()
    }
}

