//
//  AddAffirmationView.swift
//  AffirmApp
//
//  Created by Julia on 15/12/2023.
//

import SwiftUI
import CoreData

struct AddAffirmationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddAffirmationViewModel()
    @State private var newAffirmation: String = ""
    @State private var isAddAffirmationViewPresented: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack (spacing: 30) {
                Text("Dodaj afirmację")
                    .fontWeight(.semibold)
                    .font(.system(size: 30))
                if #available(iOS 16.0, *) {
                    TextField("Wpisz afirmację", text: $newAffirmation, axis: .vertical)
                    
                        .textFieldStyle(.roundedBorder)
                        .padding()
                } else {
                    TextField(text: $newAffirmation) {
                        Text("Wpisz afirmację")
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                }
                                    
                
                Button(action: {
                    guard !newAffirmation.isEmpty else { return }
                    viewModel.addAffirmation(text: newAffirmation)
                    newAffirmation = ""
                    dismiss()
                }, label: {
                    Text("Zapisz")
                })
                
            } //VStack
        } //ZStack
    }
}


#Preview {
    AddAffirmationView()
}
