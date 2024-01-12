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
                    //Color.white.ignoresSafeArea()
                    
                    VStack{
                        
                        AffirmationOfTheDayView()
                            .environmentObject(viewModel)
                        Spacer()
                        
                    }
                    
                } //ZStack
                .alert(isPresented: $viewModel.shouldShowPopup) {
                    Alert(
                        title: Text("Przyjacielu!"),
                        message: Text("Twój postęp tworzenia nawyku wynosi: \(viewModel.continuityCounter) dzień"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .sheet(isPresented: $isAddAffirmationViewPresented, content: {
                    if #available(iOS 16.0, *) {
                        AddAffirmationView()
                            .presentationDetents([.medium])
                    } else {
                        AddAffirmationView()
                    }
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
