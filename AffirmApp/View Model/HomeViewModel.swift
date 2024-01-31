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
    private var favouritesService = FavouritesService.shared
    
    init() {
        affirmationOfTheDay = getRandomAffirmation()
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
