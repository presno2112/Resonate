//
//  ResonateButton.swift
//  Resonate
//
//  Created by Sebastian Presno on 14/10/24.
//

import SwiftUI

struct HomeView: View {
    // State properties to handle the scaling effect
    @State private var outerCircleScale: CGFloat = 1.0
    @State private var middleCircleScale: CGFloat = 1.0
    @State var isPresented: Bool = false
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    
    var body: some View {
        if isOnBoarding {
            OnboardingView()
        }
        else{
            VStack(){
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
                    Text("Choose to be the ") + Text("Host").bold() + Text(" or the ") + Text("Guest").bold() + Text(" in your Resonation and share you music taste with your friends")
                }
                .frame(width: 280)
                .multilineTextAlignment(.center)
                Spacer()
                Button("Go to your profile"){
                    
                }
                .buttonStyle(CustomButtonLight())
                .frame(width: 200)
                .padding()
                Spacer()
            }
            .sheet(isPresented: $isPresented){
                ResonateView()
            }
        }
    }
}

#Preview {
    HomeView()
}

