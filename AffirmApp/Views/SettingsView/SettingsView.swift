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
    @Environment(\.scenePhase) var scenePhase
    @State private var changedProgramatically: Bool = false
    
    var body: some View {
        ZStack {
            Image(Constans.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                GroupBox {
                    HStack {
                        Image(Constans.appImage)
                            .cornerRadius(20)
                        Spacer()
                        Text(Constans.appDescription)
                    }
                } label: {
                    SettingsSectionHeaderView(title:Constans.appName, icon:Constans.infoIcon)
                    Divider()
                } // GroupBox
                .groupBoxStyle(WhiteGroupBox())
                
                GroupBox {
                    Toggle(Constans.notificationToggleText,
                           isOn: $shouldShowNotification)
                    .padding()
                    .tint(.yellow)
                    .shadow(radius: 3)
                } label: {
                    SettingsSectionHeaderView(title: Constans.notificationTitle, icon: Constans.notificationIcon)
                    Divider()
                } // GroupBoxNotifications
                .groupBoxStyle(WhiteGroupBox())
                
                GroupBox {
                    Button(action: {
                        shouldShowOnboarding = true
                    }
                           , label: {
                        Text(Constans.onboaringButton)
                    })
                    .padding()
                } label: {
                    SettingsSectionHeaderView(title: Constans.onboardingTitle, icon: Constans.onboardingIcon)
                    Divider()
                }
                .groupBoxStyle(WhiteGroupBox())
                Spacer()
            } //VStack
        
        .padding()
        .onChange(of: shouldShowNotification, perform: { _ in
            if !changedProgramatically {
                viewModel.askForPermission()
                if !shouldShowNotification {
                    viewModel.cancelNotifications()
                }
            }
        })
        } // ZStack
        .alert(isPresented: $viewModel.shouldShowGoToSettings, content: {
            Alert(title: Text(Constans.alertProgressTitle), message: Text(Constans.goToSettingsText), primaryButton: .default(Text(Constans.confirmButton), action: {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }), secondaryButton: .cancel({
                viewModel.shouldShowGoToSettings = false
            }))
        })
        .onAppear {
            changedProgramatically = true
            viewModel.checkToggle {
                changedProgramatically = false
                DispatchQueue.main.async {
                    self.viewModel.shouldShowGoToSettings = false
                }
            }
        }
        .onChange(of: scenePhase, perform: { value in
            changedProgramatically = true
            viewModel.checkToggle {
                changedProgramatically = false
                DispatchQueue.main.async {
                    self.viewModel.shouldShowGoToSettings = false
                }
            }
        })
    }
}

#Preview {
    SettingsView()
}
