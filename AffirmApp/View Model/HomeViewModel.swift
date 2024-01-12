//
//  HomeViewModel.swift
//  AffirmApp
//
//  Created by Julia on 18/12/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var affirmationOfTheDay: Affirmation = Affirmation(id: 0, description: " ")
    private var favourites: [Affirmation] = []
    @Published var isFavourite: Bool = false
    @Published var shouldShowPopup = false
    @Published var continuityCounter: Int = 1
    private var favouritesService = FavouritesService.shared
    
    init() {
        affirmationOfTheDay = getRandomAffirmation()
        checkPopupDisplay()
    }
    
    func getRandomAffirmation() -> Affirmation {
        getFavourites()
        let numberOfAffirmations = Constans.affirmations.count
        let randomId = Int.random(in: 0...numberOfAffirmations)
        let affirmation = Constans.affirmations.first {$0.id == randomId} ?? Affirmation(id: 0, description: "Będzie dobrze")
        if favourites.contains(affirmation) {
            isFavourite = true
        } else {
            isFavourite = false
        }
        return affirmation
    }
    
    func saveToFavourites() {
        favouritesService.add(affirmationOfTheDay)
        getFavourites()
        print(favourites)
    }
    
    func getFavourites() {
        favouritesService.fetch()
        favourites = favouritesService.favouritesArray
        isFavourite = favourites.contains(affirmationOfTheDay)
    }
    
    private func checkPopupDisplay() {
        let defaults = UserDefaults.standard
        let lastDisplayDate = defaults.object(forKey: "lastDisplayDate") as? Date ?? Date.distantPast
        
        if !Calendar.current.isDateInToday(lastDisplayDate) {
            shouldShowPopup = true
            
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
    
    func toggleFavourite() {
        if isFavourite {
            removeFromFavourites()
        } else {
            addToFavourites()
        }
        isFavourite.toggle()
        getFavourites()
    }
    
    private func addToFavourites() {
        favouritesService.add(affirmationOfTheDay)
        getFavourites()
    }
    
    private func removeFromFavourites() {
        favouritesService.remove(affirmationOfTheDay)
        getFavourites()
    }
    
}
