//
//  CoreDataBootcamp.swift
//  AffirmApp
//
//  Created by Julia on 31/12/2023.
//

import SwiftUI
import CoreData

struct AffirmationView: View {
 
    @StateObject var viewModel = AffirmationViewModel()
    @State var textFieldText: String = ""
    @State private var isAddAffirmationViewPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                List {
                    ForEach(viewModel.savedEntities) { affirmation in
                        Text(affirmation.name ?? "NO NAME")
                    }
                    //  .onDelete(perform: viewModel.deleteAffirmation)
                    } // List
                .navigationTitle("Lista afirmacji")
                .sheet(isPresented: $isAddAffirmationViewPresented, onDismiss: {
                    viewModel.fetchAffirmations()
                }, content: {
                    if #available(iOS 16.0, *) {
                        AddAffirmationView()
                            .presentationDetents([.medium])
                    } else {
                        AddAffirmationView()
                    }
                })
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Add affirmation
                            isAddAffirmationViewPresented.toggle()
                            
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                    
                } //toolbar
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("Affirmations")
        }
        
    }


#Preview {
    AffirmationView()
}
