//
//  ContentView.swift
//  Resonate
//
//  Created by Matteo Merola on 09/10/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isVisible = false

    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 50)
                .opacity(isVisible ? 1 : 0)
                .scaleEffect(isVisible ? 1 : 0.5)
                .animation(.spring(duration: 1).delay(0.5), value: isVisible)
            Spacer()

            Text("Create,")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .fontWeight(.light)
                .foregroundStyle(.black)
                .opacity(isVisible ? 1 : 0)
                .scaleEffect(isVisible ? 1 : 0.5)
                .animation(.easeInOut(duration: 1).delay(0.9), value: isVisible)

            Text("Share,")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .fontWeight(.light)
                .foregroundStyle(.black)
                .opacity(isVisible ? 1 : 0)
                .scaleEffect(isVisible ? 1 : 0.5)
                .animation(.easeInOut(duration: 1).delay(1.6), value: isVisible)

            Text("Enjoy.")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .fontWeight(.bold)
                .padding(.bottom, 100)
                .foregroundStyle(.black)
                .opacity(isVisible ? 1 : 0)
                .scaleEffect(isVisible ? 1 : 0.5)
                .animation(.easeInOut(duration: 1).delay(2.3), value: isVisible)

            Text("Resonate")
                .font(.system(size: 36))
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .padding(.top, 50)
                .foregroundStyle(Color("primary"))
                .opacity(isVisible ? 1 : 0)
                .scaleEffect(isVisible ? 1 : 0.5)
                .animation(.easeInOut(duration: 1.5).delay(2.9), value: isVisible)

            Spacer()

            Text("Swipe left to continue")
                .foregroundStyle(.black)
                .opacity(isVisible ? 1 : 0)  // Initially hidden
                .scaleEffect(isVisible ? 1 : 0.5)  // Initially smaller
                .onAppear {
                    withAnimation(Animation.snappy(duration: 3).delay(3.5)) {  // Final element to animate
                        isVisible = true
                    }
                }
            Spacer()
        }
    }
}

#Preview {
    WelcomeView()
}

