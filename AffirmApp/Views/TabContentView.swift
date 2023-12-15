//
//  TabView.swift
//  AffirmApp
//
//  Created by Julia on 15/12/2023.
//

import SwiftUI

struct TabContentView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            AffirmationView()
                .tabItem {
                    Label("Affirmations", systemImage: "heart.fill")
                }
        } //TabView
        
    }
}
#Preview {
    TabContentView()
}
