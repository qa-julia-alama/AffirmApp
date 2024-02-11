//
//  WelcomeView- View {}.swift
//  AffirmApp
//
//  Created by Julia on 02/02/2024.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var viewModel = WelcomeViewModel()
    @State private var username: String = ""
    @AppStorage(Constans.shouldShowNotification) var shouldShowNotification: Bool = false
    @Environment(\.scenePhase) var scenePhase
    @State private var changedProgramatically: Bool = false
    
    var body: some View {
        ZStack {
            Image(Constans.background)
                .resizable()
                .ignoresSafeArea(.all)
                .scaledToFill()
            
            VStack(spacing: 30) {
                Text(Constans.firstWelcomeHeader)
                    .font(.largeTitle)
                VStack(spacing: 0) {
                    Text(Constans.secondWelcomeHeader)
                        .font(.system(size: 20))
                    TextField("", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .shadow(radius: 3)
                } // VStack3
                
                VStack {
                    Toggle(Constans.notificationToggleText,
                           isOn: $shouldShowNotification)
                    .padding()
                    .tint(.yellow)
                    .shadow(radius: 3)
                    Text(Constans.askingForNotificationInfo)
                        .font(.caption)
                } //VStack2
                
                Button(action: {
                    viewModel.saveUsername(username)
                    viewModel.setupWelcome()
                    viewModel.shouldShowNotification(shouldShowNotification)
                }, label: {
                    Text(Constans.start)
                        .foregroundColor(.black)
                })
                .buttonStyle(.borderedProminent)
                .tint(.white)
            } // VStack1
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
    } //View2
} // View1

#Preview {
   WelcomeView()
}
