//
//  EditAffirmationViewModel.swift
//  AffirmApp
//
//  Created by Julia on 30/01/2024.
//
import CoreData
import SwiftUI
final class EditAffirmationViewModel: ObservableObject {
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func editAffirmation(affirmationId: NSManagedObjectID, newText: String) {
        do {
            if let affirmationEntity = try context.existingObject(with: affirmationId) as? AffirmationEntity {
                affirmationEntity.name = newText
                try context.save()
            }
        } catch {
            print("Error updating affirmation: \(error)")
        }
    }
}
