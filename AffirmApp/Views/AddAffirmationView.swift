//
//  AddAffirmationView.swift
//  AffirmApp
//
//  Created by Julia on 15/12/2023.
//

import SwiftUI
struct AddAffirmationView: View {
    @StateObject var viewModel = HomeViewModel()
        @State private var isAddAffirmationViewPresented: Bool = false
        @State private var newAffirmation: String = ""
    var body: some View {
        
        VStack (spacing: 30) {
            
            Color.yellow
                .sheet(isPresented: $isAddAffirmationViewPresented, content: {
                })
            TextField("Wpisz afirmację", text: $newAffirmation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Zapisz")
            })
        }
    }
}

#Preview {
    AddAffirmationView()
}
