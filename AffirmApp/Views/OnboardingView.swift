//
//  OnboardingView.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
        
      
        let images = ["onboarding1", "onboarding2", "onboarding3", "onboarding4"]
        
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
                    Image(systemName: "x.circle.fill")
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
