//
//  FavouritesService.swift
//  AffirmApp
//
//  Created by Julia on 06/01/2024.
//

import Foundation

final class FavouritesService: ObservableObject {
    private var favouritesList: Set<Affirmation> = []
    var favouritesArray: [Affirmation] = []
    private let defaults = UserDefaults.standard
    static let shared = FavouritesService()
    init() {
        fetch()
    }

    func fetch() {
        let decoder = PropertyListDecoder()
        if let data = defaults.data(forKey: Constans.favourites) {
            let favourites = try? decoder.decode(Set<Affirmation>.self, from: data)
            self.favouritesList = favourites ?? []
            self.favouritesArray = Array(favouritesList)
            return
        } else {
            self.favouritesList = []
        }
    }
    
    func contains(_ affirmation: Affirmation) -> Bool {
            favouritesList.contains(affirmation)
        }

        func add(_ affirmation: Affirmation) {
            favouritesList.insert(affirmation)
            save()
        }

        func remove(_ affirmation: Affirmation) {
            favouritesList.remove(affirmation)
            save()
        }
        
        func clear() {
            favouritesList.removeAll()
            save()
            fetch()
        }

        func save() {
            let encoder = PropertyListEncoder()
            if let encoded = try? encoder.encode(favouritesList) {
                defaults.setValue(encoded, forKey: Constans.favourites)
            }
            fetch()
        }
    }
