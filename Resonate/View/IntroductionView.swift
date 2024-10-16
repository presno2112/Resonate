//
//  IntroductionView.swift
//  Resonate
//
//  Created by Matteo Merola on 16/10/24.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        VStack {
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding()
            
            
            Text("Welcome to")
                .fontDesign(.rounded)
                .font(.system(size: 30))
                .padding(.top, -55)
            
            Text("Resonate")
                .font(.system(size: 38))
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .foregroundStyle(Color.app)
                .padding(.bottom, 50)
                .padding(.top, -40)
            
            
            Text("""
An app designed to connect music lovers by comparing their tastes and fostering meaningful relationships.

Whether the focus is on indie, hip-hop, or classical, Resonate promotes connections through the universal language of music, letting it guide users to new friendships.
""")
            .font(.system(size: 19))
            .padding(.horizontal, 40)
            .padding(.bottom, 60)
            
        }
        
        Button(action: {}) {
            Text("Get Started")
                .foregroundStyle(Color.app)
                .padding(.vertical, 25)
                .padding(.horizontal, 70)
                .background(.textField)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            
            
        }
        Spacer()
           
          
            
              
                
          
        }
    }


#Preview {
    IntroductionView()
}
