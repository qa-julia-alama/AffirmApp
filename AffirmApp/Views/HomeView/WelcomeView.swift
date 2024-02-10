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
    @State private var shouldSendNotifications: Bool = false
    
    var body: some View {
        ZStack {
            Image("background")
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
                           isOn: $shouldSendNotifications)
                    .padding()
                    .tint(.yellow)
                    .shadow(radius: 3)
                    Text(Constans.askingForNotificationInfo)
                        .font(.caption)
                } //VStack2
                
                Button(action: {
                    viewModel.saveUsername(username)
                    viewModel.setupWelcome()
                    viewModel.shouldShowNotification(shouldSendNotifications)
                }, label: {
                    Text(Constans.Start)
                        .foregroundColor(.black)
                })
                .buttonStyle(.borderedProminent)
                .tint(.white)
            } // VStack1
                .padding()
            
                .onChange(of: shouldSendNotifications, perform: { _ in
                viewModel.askForPermission()
            })
            
        } // ZStack
    } //View2
} // View1

#Preview {
   WelcomeView()
}
