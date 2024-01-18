//
//  AffirmationFavListItem.swift
//  AffirmApp
//
//  Created by Julia on 18/01/2024.
//

import SwiftUI

struct AffirmationFavListItem: View {
    
    @EnvironmentObject var viewModel: AffirmationViewModel
    var affirmation: Affirmation
    @State var isSelected: Bool = false
    @Binding var shouldShowSelection: Bool
  
  var body: some View {
      HStack {
            Text(affirmation.description)
            Spacer()
            Button(action: {
              isSelected.toggle()
              viewModel.toggleAffirmation(affirmation, value: isSelected)
            }, label: {
              if shouldShowSelection {
                Image(systemName: isSelected ? "sun.max.fill" : "sun.max")
              }
            })
          } // hstack
          .onAppear(perform: {
            isSelected = viewModel.isInProgress(affirmation)
          })
          .padding()
          .background(Color.yellow.cornerRadius(10))
  }
}

#Preview {
    AffirmationFavListItem(affirmation: Affirmation(id: 1, description: "Test affirmation"), shouldShowSelection: .constant(true))
}
