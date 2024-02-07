//
//  AffirmationViewModel.swift
//  AffirmApp
//
//  Created by Julia on 06/01/2024.
//

import Foundation
import CoreData

class AffirmationViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [AffirmationEntity] = []
    @Published var favourites: [Affirmation] = []
    private var favouritesService = FavouritesService.shared
    @Published var savedEntitiesInProgress: [AffirmationEntity: Bool] = [:]
    @Published var savedFavouritesInProgress: [Affirmation: Bool] = [:]
    @Published var shouldShowPopup = false
    @Published var continuityCounter: Int = 0
    private var affirmationCounter: Int = 0
    let hapticManager = HapticManager.shared
    
    
    init() {
        container = NSPersistentContainer(name:  "AffirmationsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchAffirmations()
        getFavourites()
        addEntitiesInProgress()
        addFavouritesInProgress()
        
    } // init
    
    func fetchAffirmations() {
        let request = NSFetchRequest<AffirmationEntity>(entityName: "AffirmationEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addAffirmation(text: String) {
        let newAffirmation = AffirmationEntity(context: container.viewContext)
        newAffirmation.name = text
        saveData()
        savedEntitiesInProgress[newAffirmation] = false
    }
    
    
    func deleteAffirmation(offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let affirmationEntity = savedEntities[index]
        container.viewContext.delete(affirmationEntity)
        saveData()
        savedEntitiesInProgress.removeValue(forKey: affirmationEntity)
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchAffirmations()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
    func getFavourites() {
        favouritesService.fetch()
        favourites = favouritesService.favouritesArray
    }
    
    func deleteFavourite(offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let affirmation = favourites[index]
        favouritesService.remove(affirmation)
        getFavourites()
    }
    
    func editAffirmation(originalText: String, newText: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AffirmationEntity")
        request.predicate = NSPredicate(format: "name == %@", originalText)
        do {
            let fetchResult = try container.viewContext.fetch(request) as? [NSManagedObject]
            fetchResult?[0].setValue(newText, forKey: "name")
        } catch {
            print("Error fetching from data base: \(error)")
        }
        saveData()
    }
    
    private func updateAffirmationCounterAndSaveActivity() {
        let today = Date()
        let savedEntitiesCount = savedEntitiesInProgress.filter { $0.value }.count

           // Zliczanie afirmacji z drugiej listy
           let savedFavouritesCount = savedFavouritesInProgress.filter { $0.value }.count

           // Sumowanie afirmacji z obu list
           let totalAffirmationsCount = savedEntitiesCount + savedFavouritesCount

        // if date exists + current activities
        UserActivityService.shared.saveActivity(for: today, affirmationsCount: totalAffirmationsCount)
        }
        
    func toggleAffirmation(_ affirmation: AffirmationEntity, value: Bool) {
        savedEntitiesInProgress[affirmation] = value
        if value == true {
            affirmationCounter += 1
        } else {
            affirmationCounter -= 1
        }
        checkAffirmationCounter()
        updateAffirmationCounterAndSaveActivity()
    }
    
    func toggleAffirmation(_ affirmation: Affirmation, value: Bool) {
        savedFavouritesInProgress[affirmation] = value
        if value == true {
            affirmationCounter += 1
        } else {
            affirmationCounter -= 1
        }
        checkAffirmationCounter()
        updateAffirmationCounterAndSaveActivity()
    }
    
    
    func isInProgress(_ affirmation: AffirmationEntity) -> Bool {
        return savedEntitiesInProgress[affirmation] ?? false
    }
    
    func isInProgress(_ affirmation: Affirmation) -> Bool {
        return savedFavouritesInProgress[affirmation] ?? false
    }
    
    func addEntitiesInProgress() {
        for affirmation in savedEntities {
            savedEntitiesInProgress[affirmation] = false
        }
    }
    
    func addFavouritesInProgress() {
        for affirmation in favourites {
            savedFavouritesInProgress[affirmation] = false
        }
    }
    
    func checkAffirmationCounter() {
        let totalAffirmations = savedEntities.count + favourites.count // Łączna liczba afirmacji

        if affirmationCounter == 5 {
            checkPopupDisplay()
        }
        // Sprawdzenie czy wszystkie afirmacje są zaznaczone
        if affirmationCounter == totalAffirmations {
            affirmationProgressCompleted() // Wywołanie wibracji, gdy wszystkie afirmacje są zaznaczone
        }
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
    
    func affirmationProgressCompleted() {
        hapticManager.notification(type: .success)
        hapticManager.impact(style: .rigid)
    }
}
