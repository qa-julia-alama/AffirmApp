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
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.setupLocalNotifications(hour: 17, minute: 00)
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func setupLocalNotifications(hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
            content.title = "Przyjacielu!"
            content.subtitle = "Pamiętaj o codzinnych afirmacjach"
        content.sound = UNNotificationSound.default
        
        var datComp = DateComponents()
        datComp.hour = hour
        datComp.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func shouldShowNotification(_ status: Bool) {
        UserDefaults.standard.set(status, forKey: "shouldShowNotification")
    }
}
