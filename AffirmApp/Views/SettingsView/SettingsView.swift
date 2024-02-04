//
//  SettingsView.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("shouldShowNotification") var shouldShowNotification: Bool = true
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack {
            GroupBox {
                HStack {
                    Image("appImage")
                        .cornerRadius(20)
                    Spacer()
                    Text("Opis apki")
                }
            } label: {
                SettingsSectionHeaderView(title: "AffirmApp", icon: "info.circle")
                Divider()
            } // GroupBoxAffirmApp
            
            GroupBox {
                    Toggle("Czy chcesz dostawac przypomnienia o codziennej afirmacji?",
                           isOn: $shouldShowNotification)
                    .padding()
                    .tint(.yellow)
                    .shadow(radius: 3)
            } label: {
                SettingsSectionHeaderView(title: "Powiadomienia", icon: "bell.badge.circle")
                Divider()
            } // GroupBoxPowiadomienia
            
            GroupBox {
                    Button(action: {
                        shouldShowOnboarding = true
                    }
                            , label: {
                        Text("Zobacz samouczek")
                    })
                    .padding()
            } label: {
                SettingsSectionHeaderView(title: "Samouczek", icon: "book.circle")
                Divider()
            }
            Spacer()
        } //VStack
        .padding()
        .onChange(of: shouldShowNotification, perform: { value in
            viewModel.shouldShowNotification(shouldShowNotification)
            viewModel.askForPermission()
        })
    }
}

#Preview {
    SettingsView()
}
