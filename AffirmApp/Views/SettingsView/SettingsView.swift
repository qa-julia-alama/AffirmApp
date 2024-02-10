//
//  SettingsView.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(Constans.shouldShowNotification) var shouldShowNotification: Bool = true
    @AppStorage(Constans.shouldShowOnboarding) var shouldShowOnboarding: Bool = true
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack {
            GroupBox {
                HStack {
                    Image(Constans.appImage)
                        .cornerRadius(20)
                    Spacer()
                    Text(Constans.appDescription)
                }
            } label: {
                SettingsSectionHeaderView(title: Constans.appName, icon: "info.circle")
                Divider()
            } // GroupBoxAffirmApp
            
            GroupBox {
                Toggle(Constans.notificationToggleText,
                           isOn: $shouldShowNotification)
                    .padding()
                    .tint(.yellow)
                    .shadow(radius: 3)
            } label: {
                SettingsSectionHeaderView(title: Constans.notificationTitle, icon: "bell.badge.circle")
                Divider()
            } // GroupBoxNotifications
            
            GroupBox {
                    Button(action: {
                        shouldShowOnboarding = true
                    }
                            , label: {
                        Text(Constans.onboaringSettingsButton)
                    })
                    .padding()
            } label: {
                SettingsSectionHeaderView(title: Constans.onboardingTitle, icon: "book.circle")
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
