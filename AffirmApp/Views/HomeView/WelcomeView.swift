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
                Text("Witaj Przyjacielu!")
                    .font(.largeTitle)
                VStack(spacing: 0) {
                    Text("Jak sie nazywasz?")
                        .font(.system(size: 20))
                    TextField("", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .padding(30)
                        .shadow(radius: 3)
                } // VStack3 (hstack)
                
                VStack {
                    Toggle("Czy chcesz dostawac przypomnienia o codziennej afirmacji?",
                           isOn: $shouldSendNotifications)
                    .padding(30)
                    .tint(.yellow)
                    .shadow(radius: 3)
                    Text("Powiadomienia mozesz pozniej wylaczyc w ustawieniach aplikacji")
                        .font(.caption)
                } //VStack2
                
                Button(action: {
                    viewModel.saveUsername(username)
                    if shouldSendNotifications {
                        viewModel.setupLocalNotifications()
                    }
                    viewModel.setupWelcome()
                }, label: {
                    Text("Start")
                        .foregroundColor(.black)
                })
                .buttonStyle(.borderedProminent)
                .tint(.white)
            } // VStack1
                .padding(30)
        } // ZStack
        .padding(30)
    } //View2
        
} // View1

#Preview {
   WelcomeView()
}
