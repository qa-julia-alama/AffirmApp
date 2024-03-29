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
    
    @EnvironmentObject var viewModel: AffirmationViewModel
    @State var textFieldText: String = ""
    @State private var isAddAffirmationViewPresented: Bool = false
    @State private var pickerTab: PickerTab = .moje
    @State private var isEditViewPresented: Bool = false
    @State private var affirmationToEdit: String = ""
    @State private var isAffirmationInProgress: Bool = false


    
    private var totalAffirmationsCount: Int {
        viewModel.savedEntitiesInProgress.count + viewModel.savedFavouritesInProgress.count
    }
    
    private var progress: CGFloat {
        let selectedEntitiesCount = viewModel.savedEntitiesInProgress.filter { $0.value }.count
        let selectedFavouritesCount = viewModel.savedFavouritesInProgress.filter { $0.value }.count
        let selectedCount = selectedEntitiesCount + selectedFavouritesCount
        let totalCount = viewModel.savedEntities.count + viewModel.favourites.count
        return totalCount > 0 ? CGFloat(selectedCount) / CGFloat(totalCount) : 0
    }
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                Picker("", selection: $pickerTab) {
                    ForEach(PickerTab.allCases, id: \.self) { tab in
                        Text(tab.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                Button {
                    isAffirmationInProgress.toggle()
                } label: {
                    Text(isAffirmationInProgress ? Constans.affirmationModeOff : Constans.affirmationModeOn)
                }
                
                if isAffirmationInProgress {
                    AffirmationProgressBarView(progress: progress)
                        .frame(height: 20)
                        .padding(.horizontal)
                }
                
                switch pickerTab {
                case .moje:
                    List {
                        ForEach(viewModel.savedEntities, id: \.self) { affirmation in
                            AffirmationListItemView(affirmation: affirmation, shouldShowSelection: $isAffirmationInProgress)
                                .listRowSeparator(.hidden)
                                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                    Button {
                                        isEditViewPresented.toggle()
                                        affirmationToEdit = affirmation.name ?? ""
                                    } label: {
                                        Label("", systemImage: "pencil")
                                    }
                                }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                                                Button {
                                                                    viewModel.deleteAffirmation(affirmation)
                                                                } label: {
                                                                    Label("", systemImage: "xmark.bin")
                                                                }
                                                                .tint(.red)
                                                            }
                        }
                    } // List
                    .listStyle(PlainListStyle())
                    .background(Color.white)
                    .sheet(isPresented: $isEditViewPresented, onDismiss: {
                        viewModel.fetchAffirmations()
                    }) {
                        if #available(iOS 16.0, *) {
                            EditAffirmationView(text: $affirmationToEdit)
                            .presentationDetents([.medium])
                        } else {
                            EditAffirmationView(text: $affirmationToEdit)
                        }
                    }
                    
                    
                case .ulubione:
                    List {
                        ForEach(viewModel.favourites, id: \.id) { affirmation in
                            AffirmationFavListItem(affirmation: affirmation, shouldShowSelection: $isAffirmationInProgress)
                                .listRowSeparator(.hidden)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button {
                                        viewModel.deleteFavourite(affirmation)
                                    } label: {
                                        Label("", systemImage: "xmark.bin")
                                    }
                                    .tint(.red)
                                }
                        }
                    } // List
                    .listStyle(PlainListStyle())
                    .background(Color.white)
                }
                Spacer()
            } // VStack
            .alert(isPresented: $viewModel.shouldShowPopup) {
                    Alert(
                        title: Text(Constans.alertProgressTitle),
                      message: Text("Twój postęp tworzenia nawyku wynosi: \(viewModel.continuityCounter) dzień"),
                        dismissButton: .default(Text(Constans.confirmButton))
                    )
                  } // alert
            .onAppear {
                viewModel.getFavourites()
                viewModel.fetchAffirmations()
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
            .navigationTitle(Constans.affirmationPageTitle)
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


//#Preview {
   // AffirmationView()
//}
