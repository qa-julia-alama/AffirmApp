//
//  ProgressChartViewModel.swift
//  AffirmApp
//
//  Created by Julia on 07/02/2024.
//

import Foundation
import Combine

final class ProgressChartViewModel: ObservableObject {
    @Published var activities: [UserActivity] = []
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        subscribeToActivitiesUpdates()
    }
    
    private func subscribeToActivitiesUpdates() {
        UserActivityService.shared.$activities
            .sink { [weak self] newActivities in
                           self?.activities = newActivities
                           print("Activities loaded to ViewModel: \(newActivities)")
                       }
            .store(in: &cancellables)
    }
}
