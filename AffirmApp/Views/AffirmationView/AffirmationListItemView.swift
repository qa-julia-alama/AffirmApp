//
//  AffirmationListItemView.swift
//  AffirmApp
//
//  Created by Julia on 15/01/2024.
//

import SwiftUI

struct AffirmationListItemView: View {
    
    @EnvironmentObject var viewModel: AffirmationViewModel
    var affirmation: AffirmationEntity
    @State var isSelected: Bool = false
    @Binding var shouldShowSelection: Bool
    
    var body: some View {
        HStack {
            Text(affirmation.name ?? "NO NAME")
            Spacer()
            Button(action: {
                isSelected.toggle()
                viewModel.toggleAffirmation(affirmation, value: isSelected)
            }, label: {
                if shouldShowSelection {
                    Image(systemName: isSelected ? "sun.max.fill" : "sun.max")
                }
            })
            .disabled(shouldShowSelection ? false : true)
        } // hstack
        .onAppear(perform: {
            isSelected = viewModel.isInProgress(affirmation)
        })
        .padding()
        .background(Color.yellow.cornerRadius(10))
    }
}

#Preview {
    AffirmationListItemView(affirmation: AffirmationEntity(), shouldShowSelection: .constant(true))
}
