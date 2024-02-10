//
//  UserActivityService.swift
//  AffirmApp
//
//  Created by Julia on 07/02/2024.
//

import Foundation
import SwiftUI
import Combine


class UserActivityService: ObservableObject {
    static let shared = UserActivityService()
    private let defaults = UserDefaults.standard
    private let userActivityKey = "userActivityKey"

    @Published var activities: [UserActivity] = []
    
    init() {
        self.activities = loadActivities()
    }
    
    // Save user activity for certain day
    func saveActivity(for date: Date, affirmationsCount: Int) {
        var activities = loadActivities()
        if let index = activities.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
            activities[index].affirmationsCount = affirmationsCount
        } else {
            let newActivity = UserActivity(date: date, affirmationsCount: affirmationsCount)
            activities.append(newActivity)
        }
        if let data = try? JSONEncoder().encode(activities) {
            defaults.set(data, forKey: userActivityKey)
            self.activities = loadActivities()
            print("Activities saved: \(self.activities)")
        }
    }

    
    func loadActivities() -> [UserActivity] {
        guard let data = defaults.data(forKey: userActivityKey), let activities = try? JSONDecoder().decode([UserActivity].self, from: data) else {
            return []
        }
        return activities
    }
}
