//
//  LocalNotification.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    func askForPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                self.setupLocalNotifications(hour: 17, minute: 00)
                self.shouldShowNotification(true)
            } else if !granted {
                self.shouldShowNotification(false)
            } else if let error = error {
                self.shouldShowNotification(false)
                print(error.localizedDescription)
            }
        }
    }
    
    func setupLocalNotifications(hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = Constans.alertProgressTitle
        content.subtitle = Constans.notificationAlertDescription
        content.sound = UNNotificationSound.default
        
        var datComp = DateComponents()
        datComp.hour = hour
        datComp.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func shouldShowNotification(_ status: Bool) {
        UserDefaults.standard.set(status, forKey: Constans.shouldShowNotification)
        if status == false {
            cancelScheduledNotification()
        }
    }
    
    func cancelScheduledNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func isNotificationPermissionGranted() -> Bool {
        var granted: Bool = false
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined, .denied:
                granted = false
            case .authorized, .provisional, .ephemeral:
                granted = true
            default:
                granted = false
            }
        }
        return granted
    }
}
