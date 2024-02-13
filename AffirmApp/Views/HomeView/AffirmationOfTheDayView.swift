//
//  AffirmationOfTheDayView.swift
//  AffirmApp
//
//  Created by Julia on 16/12/2023.
//

import SwiftUI

struct AffirmationOfTheDayView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        
        
        // ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(Constans.gradient)
            .frame(height: 200)
            .shadow(radius: 20)
            .onAppear(perform: {
                viewModel.getFavourites()
            })
        //                .padding()
            .overlay(alignment: .topTrailing, content: {
                Button(action: {
                    viewModel.affirmationOfTheDay = viewModel.getRandomAffirmation()
                }, label: {
                    Image(systemName: Constans.arrowIcon)
                        .padding()
                        .background(Circle().fill(.white.opacity(0.8)).padding(10))
                })
            })
            .overlay(alignment: .center) {
                
                VStack(spacing:10) {
                    Text(Constans.affirmationOfTheDayCardTitle)
                        .font(.title2)
                        .bold()
                    
                    Text(viewModel.affirmationOfTheDay.description)
                        .padding(.horizontal, 25)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        viewModel.toggleFavourite()
                    }, label: {
                        Image(systemName: viewModel.isFavourite ? Constans.starFilledIcon : Constans.starEmptyIcon)
                            .padding()
                    })
                }
            }
            .padding()
        
        // }//ZStack
        
    }
    
}
#Preview {
    AffirmationOfTheDayView()
}

