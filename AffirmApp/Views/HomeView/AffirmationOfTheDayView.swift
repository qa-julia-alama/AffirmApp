//
//  AffirmationOfTheDayView.swift
//  AffirmApp
//
//  Created by Julia on 16/12/2023.
//

import SwiftUI

struct AffirmationOfTheDayView: View {
    @Binding var affirmation: Affirmation
    var body: some View {
        
// ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Constans.gradient)
                .frame(height: 200)
                .shadow(radius: 20)
                .padding()
                .overlay(alignment: .center) {
                    Text(affirmation.description)
                        .padding(.horizontal, 15)
                        .multilineTextAlignment(.center)
                }
            
          
       // }//ZStack
        
    }
}
    #Preview {
        AffirmationOfTheDayView(affirmation: .constant(Affirmation(id: 11, description: "Będzie dobrze")))
    }

