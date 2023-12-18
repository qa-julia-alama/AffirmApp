//
//  HomeView.swift
//  AffirmApp
//
//  Created by Julia on 15/12/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var isAddAffirmationViewPresented: Bool = false
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.white.ignoresSafeArea()
                
                VStack{
                
                    AffirmationOfTheDayView(affirmation: $viewModel.affirmationOfTheDay)
                    Spacer()
                
                }
                
            } //ZStack
            .sheet(isPresented: $isAddAffirmationViewPresented, content: {
                AddAffirmationView()
            })
            .navigationTitle("Witaj przyjacielu!")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                    // Add affirmation
                        isAddAffirmationViewPresented.toggle()
                        print(isAddAffirmationViewPresented)
                }, label: {
                    Image(systemName: "plus")
                })
                    }
            
            } //toolbar
             } //NavigationView
    }
}

#Preview {
    HomeView()
}
