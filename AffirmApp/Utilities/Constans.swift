//
//  Constans.swift
//  AffirmApp
//
//  Created by Julia on 18/12/2023.
//

import Foundation
import SwiftUI

struct Constans {
    static var gradient: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    static let affirmations: [Affirmation] = [Affirmation(id: 1, description: " Jestem fajny"), Affirmation(id:2, description: "zxt"), Affirmation(id: 3, description: "3ci")]
}
