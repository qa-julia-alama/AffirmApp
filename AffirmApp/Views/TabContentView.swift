//
//  TabView.swift
//  AffirmApp
//
//  Created by Julia on 15/12/2023.
//

import SwiftUI

struct TabContentView: View {
    
    @StateObject var viewModel = AffirmationViewModel()
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label(Constans.start, systemImage: "house.fill")
                }
            
            AffirmationView()
                .tabItem {
                    Label(Constans.affirmationTabName, systemImage: "heart.fill")
                }
                .environmentObject(viewModel)
        } //TabView
    }
}
#Preview {
    TabContentView()
}
