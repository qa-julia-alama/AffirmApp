//
//  HomeViewModel.swift
//  AffirmApp
//
//  Created by Julia on 18/12/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var affirmationOfTheDay: Affirmation = Affirmation(id: 0, description: " ")
    
    @Published var shouldShowPopup = false
    @Published var continuityCounter: Int = 1
    
    init() {
            affirmationOfTheDay = getRandomAffirmation()
            checkPopupDisplay()
    }
    
    func getRandomAffirmation() -> Affirmation {
        let numberOfAffirmations = Constans.affirmations.count
        let randomId = Int.random(in: 0...numberOfAffirmations)
        let affirmation = Constans.affirmations.first {$0.id == randomId} ?? Affirmation(id: 0, description: "Będzie dobrze")
    return affirmation
    }
    
    private func checkPopupDisplay() {
        let defaults = UserDefaults.standard
        let lastDisplayDate = defaults.object(forKey: "lastDisplayDate") as? Date ?? Date.distantPast

        if !Calendar.current.isDateInToday(lastDisplayDate) {
            shouldShowPopup = true
            defaults.set(Date(), forKey: "lastDisplayDate")

            // Aktualizacja licznika ciągłości
            updateContinuityCounter()
        }
    }

    private func updateContinuityCounter() {
        let defaults = UserDefaults.standard
        let lastDisplayDate = defaults.object(forKey: "lastDisplayDate") as? Date ?? Date.distantPast

        if Calendar.current.isDateInYesterday(lastDisplayDate) {
            let counter = defaults.integer(forKey: Constans.counter)
        defaults.set(counter + 1, forKey: Constans.counter)
        continuityCounter = counter + 1
            defaults.set(Date(), forKey: "lastDisplayDate")
     } else {
            continuityCounter = 1 // Resetuj licznik
         defaults.set(Date(), forKey: "lastDisplayDate")
         defaults.set(1, forKey: Constans.counter)
        }
    }
}