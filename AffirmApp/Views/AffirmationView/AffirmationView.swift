//
//  CoreDataBootcamp.swift
//  AffirmApp
//
//  Created by Julia on 31/12/2023.
//

import SwiftUI
import CoreData

enum PickerTab:  StringLiteralType, CaseIterable {
    case moje
    case ulubione
}

struct AffirmationView: View {
    
    @StateObject var viewModel = AffirmationViewModel()
    @State var textFieldText: String = ""
    @State private var isAddAffirmationViewPresented: Bool = false
    @State private var pickerTab: PickerTab = .moje
    @State private var isEditViewPresented: Bool = false
    @State private var selectedAffirmationIndex: Int?
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                Picker("", selection: $pickerTab) {
                    ForEach(PickerTab.allCases, id: \.self) { tab in
                        Text(tab.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                switch pickerTab {
                case .moje:
                    List {
                        ForEach(viewModel.savedEntities.indices, id: \.self) { index in
                            Text(viewModel.savedEntities[index].name ?? "NO NAME")
                                .onLongPressGesture {
                                    self.selectedAffirmationIndex = index
                                    self.textFieldText = viewModel.savedEntities[index].name ?? ""
                                    self.isEditViewPresented = true
                                }
                        }
                        .onDelete { indexSet in
                            viewModel.deleteAffirmation(offsets: indexSet)
                        }
                    } // List
                    .sheet(isPresented: $isEditViewPresented, onDismiss: {
                        viewModel.fetchAffirmations()
                    }) {
                        if #available(iOS 16.0, *) {
                            EditAffirmationView(text: $textFieldText, onSave: {
                                if let index = selectedAffirmationIndex {
                                    viewModel.editAffirmation(index: index, newText: textFieldText)
                                    isEditViewPresented = false
                                }
                            } )
                            .presentationDetents([.medium])
                        } else {
                            EditAffirmationView(text: $textFieldText, onSave: {
                                if let index = selectedAffirmationIndex {
                                    viewModel.editAffirmation(index: index, newText: textFieldText)
                                    isEditViewPresented = false
                                }
                            })
                        }
                    }
                    
                    
                case .ulubione:
                    List {
                        ForEach($viewModel.favourites, id: \.self) { affirmation in
                            Text(affirmation.wrappedValue.description)
                        }
                        .onDelete { indexSet in
                            viewModel.deleteFavourite(offsets: indexSet)
                        }
                    } // List
                }
                Spacer()
            } // VStack
            .onAppear {
                viewModel.getFavourites()
            }
            .sheet(isPresented: $isAddAffirmationViewPresented, onDismiss: {
                viewModel.fetchAffirmations()
            }, content: {
                if #available(iOS 16.0, *) {
                    AddAffirmationView()
                        .presentationDetents([.medium])
                } else {
                    AddAffirmationView()
                }
            }) // sheet
            .navigationTitle("Lista afirmacji")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Add affirmation
                        isAddAffirmationViewPresented.toggle()
                        
                    }, label: {
                        Image(systemName: "plus")
                    })
                } // ToolbarItem
                
            } // toolbar
            
        }
        
    }
    
}


#Preview {
    AffirmationView()
}
