//
//  OnBoardingView.swift
//  Resonate
//
//  Created by Sebastian Presno on 15/10/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentTab = OnboardingSlide.welcome

    var body: some View {
        NavigationView {
            TabView(selection: $currentTab) {
                WelcomeView(onAnimationComplete: {
                    // Automatically switch to next slide after animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        currentTab = .introduction
                    }
                })
                .tag(OnboardingSlide.welcome)

                // IntroductionView now takes care of navigation via NavigationLink
                IntroductionView()
                    .tag(OnboardingSlide.introduction)
            }
            .tabViewStyle(PageTabViewStyle())
            .animation(.easeInOut, value: currentTab)
        }
    }
}

enum OnboardingSlide: Int, CaseIterable {
    case welcome
    case introduction
}


// Preview for testing in Xcode's preview canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
