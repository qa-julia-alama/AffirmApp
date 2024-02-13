//
//  OnboardingView.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage(Constans.shouldShowOnboarding) var shouldShowOnboarding: Bool = true
        
      
    let images = [Constans.onboarding1, Constans.onboarding2, Constans.onboarding3, Constans.onboarding4]
        
        var body: some View {
            TabView {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                }
                
            } //TabView
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .background(Color(.white))
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    shouldShowOnboarding = false
                }, label: {
                    Image(systemName: Constans.closeIcon)
                        .resizable()
                        .frame(width: 40, height: 40)
                })
                .padding()
            }
        }
    }

#Preview {
    OnboardingView()
}
