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
        print("init")
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
    }
    
    
    func deleteAffirmation(offsets: IndexSet) {
            guard let index = offsets.first else { return }
            let affirmationEntity = savedEntities[index]
            container.viewContext.delete(affirmationEntity)
            saveData()
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
    
}
