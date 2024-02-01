//
//  EditAffirmationView.swift
//  AffirmApp
//
//  Created by Julia on 13/01/2024.
//

import SwiftUI

struct EditAffirmationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AffirmationViewModel
    @Binding var text: String
    @State private var originalText: String = ""
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack (spacing: 30) {
                Text("Edytuj afirmację")
                    .fontWeight(.semibold)
                    .font(.system(size: 30))
                
                TextField("Wprowadź afirmację", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    viewModel.editAffirmation(originalText: originalText, newText: text)
                    dismiss()
                } label: {
                    Text("Zapisz")
                }
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.blue)
                .frame(height:55)
                .frame(maxWidth: .infinity)
                .shadow(color: Color.white.opacity(0.10),
                        radius: 10, x: 0.0, y: 10)
            } // VStack
        } // ZStack
        .onAppear {
            originalText = text
        }
    }
}


#Preview {
    EditAffirmationView(text: .constant(""))
}
