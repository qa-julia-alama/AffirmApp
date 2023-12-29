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
        
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack (spacing: 30) {
                Text("Dodaj afirmację")
                    .fontWeight(.semibold)
                    .font(.system(size: 30))
                    
                TextField("Wpisz afirmację", text: $newAffirmation, axis: .vertical)

                    .textFieldStyle(.roundedBorder)
                    .padding()
                
//                TextField("Wpisz afirmację", text: $newAffirmation)
//                    .padding()
//                    
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Zapisz")
                })
                
            }
        }
    }
}

#Preview {
    AddAffirmationView()
}
