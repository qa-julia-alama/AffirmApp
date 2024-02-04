//
//  OnboardingView.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    var body: some View {
        TabView {
            ForEach(1..<5) { item  in
                Image("appImage")
                    .resizable()
                    .scaledToFit()
            }
        } //TabView
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .background(.black)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                shouldShowOnboarding = false
            }
                   , label: {
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
