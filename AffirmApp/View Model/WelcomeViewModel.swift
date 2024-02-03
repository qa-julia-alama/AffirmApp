//
//  WelcomeViewModel.swift
//  AffirmApp
//
//  Created by Julia on 02/02/2024.
//

import Foundation

final class WelcomeViewModel: ObservableObject {
    
    func saveUsername(_ name: String) {
        UserDefaults.standard.setValue(name, forKey: "username")
    }
    
    func setupLocalNotifications() {
        // logika z notyfikacji
    }
    
    func setupWelcome() {
        UserDefaults.standard.setValue(false, forKey: "shouldShowWelcome")
    }
}
