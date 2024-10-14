//
//  ResonateButton.swift
//  Resonate
//
//  Created by Sebastian Presno on 14/10/24.
//

import SwiftUI

struct ResonateButton: View {
    // State properties to handle the scaling effect
    @State private var outerCircleScale: CGFloat = 1.0
    @State private var middleCircleScale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .scaleEffect(outerCircleScale)
                .foregroundStyle(Color("aux1"))
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(duration: 1.2)
                            .repeatForever(autoreverses: true)
                    ) {
                        outerCircleScale = 1.2
                    }
                }
            
            Circle()
                .frame(width: 270, height: 270)
                .scaleEffect(middleCircleScale)
                .foregroundStyle(Color("secondary"))
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(duration: 1.0)
                            .repeatForever(autoreverses: true)
                            .delay(0.3)
                    ) {
                        middleCircleScale = 1.1
                    }
                }
            Button{
                
            }label: { //Missing image
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.purple)
            }
        }
    }
}

#Preview {
    ResonateButton()
}

