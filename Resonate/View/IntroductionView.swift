//
//  IntroductionView.swift
//  Resonate
//
//  Created by Matteo Merola on 16/10/24.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 220)
                        .padding()

                    Text("Welcome to")
                        .fontDesign(.rounded)
                        .font(.system(size: 30))
                        .padding(.top, -45)

                    Text("Resonate")
                        .font(.system(size: 38))
                        .fontDesign(.monospaced)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("terciary"))
                        .padding(.bottom, 50)
                        .padding(.top, -35)

                    Text("""
    An app designed to connect music lovers by comparing their tastes and fostering meaningful relationships.
    
    Whether the focus is on indie, hip-hop, or classical, Resonate promotes connections through the universal language of music, letting it guide users to new friendships.
    """)
                    .font(.system(size: 19))
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)

                }

                // NavigationLink to SignUpView
                NavigationLink(destination: SignUpView()) {
                    Text("Get Started")
                }
                .buttonStyle(CustomButtonLight())
                .frame(width: 200)

                Spacer()
            }
        }
    }
}

#Preview {
    IntroductionView()
}
