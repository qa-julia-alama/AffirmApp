//
//  HomeView.swift
//  AffirmApp
//
//  Created by Julia on 15/12/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @AppStorage("username") var username: String = ""
    @State private var isAddAffirmationViewPresented: Bool = false
    var body: some View {
        
        NavigationView {
           
                ZStack{
                    //Color.white.ignoresSafeArea()
                    
                    VStack{
                        
                        AffirmationOfTheDayView()
                        ProgressChartView()
                            .padding(.top)
                        Spacer()
                    }
                    
                } //ZStack
                .environmentObject(viewModel)
                .sheet(isPresented: $isAddAffirmationViewPresented, content: {
                    if #available(iOS 16.0, *) {
                        AddAffirmationView()
                            .presentationDetents([.medium])
                    } else {
                        AddAffirmationView()
                    }
                })
        
                .navigationTitle("Witaj \(username)!")

                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Add affirmation
                            isAddAffirmationViewPresented.toggle()
                            print(isAddAffirmationViewPresented)
                        }, label: {
                            Image(systemName: "plus")
                        })
                    } // ToolbarItem
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape")
                        }
                    }
                } //toolbar
            } //NavigationView
        }
    }


#Preview {
    HomeView()
}
