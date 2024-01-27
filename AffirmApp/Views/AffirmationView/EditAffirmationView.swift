//
//  EditAffirmationView.swift
//  AffirmApp
//
//  Created by Julia on 13/01/2024.
//

import SwiftUI

struct EditAffirmationView: View {
    @Binding var text: String
    var onSave: () -> Void
    
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
                
                Button("Zapisz", action: onSave)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.blue)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .shadow(color: Color.white.opacity(0.10),
                            radius: 10, x: 0.0, y: 10)
            } // VStack
        } // ZStack
    }
}


#Preview {
    EditAffirmationView(text: .constant(""), onSave: {})
}
