//
//  HomeView.swift
//  AffirmApp
//
//  Created by Julia on 15/12/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isAddAffirmationViewPresented: Bool = false
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.white.ignoresSafeArea()
                
                ScrollView{
            
                }
            } //ZStack
            .sheet(isPresented: $isAddAffirmationViewPresented, content: {
                AddAffirmationView()
            })
            .navigationTitle("Affirmation App")
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
