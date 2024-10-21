//
//  ResonateButton.swift
//  Resonate
//
//  Created by Sebastian Presno on 14/10/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    @State private var isPresented: Bool = false
    @State private var resonated: Bool = false
    @StateObject private var localNetwork = LocalNetworkSessionCoordinator()
    
    var body: some View {
        if isOnBoarding {
            OnboardingView()
        }
        else if (resonated) {
            ResultsView(targetPercentage: 82)
        }
        else{
            NavigationStack {
                VStack {
                    Spacer()
                    Group {
                        Text("Tap to ") +
                        Text("Resonate ").foregroundColor(Color("terciary")).bold() +
                        Text("with\n someone ")
                    }
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.title2)
                    Spacer()
                    
                    ResonateButton(isPresented: $isPresented)
                    
                    Spacer()
                    Group{
                        Text("Choose to be the ") + Text("Host").bold() + Text(" or the ") + Text("Guest").bold() + Text(" in your Resonation and share your music taste with your friends")
                    }
                    .frame(width: 280)
                    .multilineTextAlignment(.center)
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Text("Go to your profile")
                    }
                    .buttonStyle(CustomButtonLight())
                    .frame(width: 200)
                    Spacer()
                }
            }
            .sheet(isPresented: $isPresented) {
                ResonateView(isConnected : $resonated)
            }
        }
    }
}

#Preview {
    HomeView()
}


