//
//  HomeViewModel.swift
//  AffirmApp
//
//  Created by Julia on 18/12/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var affirmationOfTheDay: Affirmation = Affirmation(id: 0, description: " ")
    
    init() {
            affirmationOfTheDay = getRandomAffirmation()
    }
    
    func getRandomAffirmation() -> Affirmation {
        let numberOfAffirmations = Constans.affirmations.count
        let randomId = Int.random(in: 0...numberOfAffirmations)
        let affirmation = Constans.affirmations.first {$0.id == randomId} ?? Affirmation(id: 0, description: "Będzie dobrze")
    return affirmation
    }
}
