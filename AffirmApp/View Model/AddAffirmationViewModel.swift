//
//  AddAffirmationViewModel.swift
//  AffirmApp
//
//  Created by Julia on 06/01/2024.
//

import Foundation
import CoreData

final class AddAffirmationViewModel: ObservableObject{
    
    let container: NSPersistentContainer
    @Published var savedEntities: [AffirmationEntity] = []
    
    init() {
        container = NSPersistentContainer(name:  "AffirmationsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
    } // init
    
    func saveData() {
        do {
            try container.viewContext.save()
            
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
    func addAffirmation(text: String) {
        let newAffirmation = AffirmationEntity(context: container.viewContext)
        newAffirmation.name = text
        saveData()
    }
}
