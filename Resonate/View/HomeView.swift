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
    
    var body: some View {
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
            
            ResonateButton()
            
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
        }
    }
}

#Preview {
    HomeView()
}

