//
//  OnBoardingView.swift
//  Resonate
//
//  Created by Sebastian Presno on 15/10/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            WelcomeView()
            SecondSlideView()
            ThirdSlideView()
            FinalSlideView()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

// Slide 1: Welcome View
struct WelcomeView: View {
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Thank you for joining us!")
                    .padding(.top, 10)
                    .font(.body)
            }
            .padding()
        }
    }
}

// Slide 2: A Text Slide
struct SecondSlideView: View {
    var body: some View {
        VStack {
            Text("Here's some information about our app.")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

// Slide 3: Another Text Slide
struct ThirdSlideView: View {
    var body: some View {
        VStack {
            Text("We value your feedback!")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

// Slide 4: Final Slide with TextFields and Button
struct FinalSlideView: View {
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Let's get started!")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            TextField("Enter your name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("Enter your email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
            
            TextField("Enter your phone", text: $phone)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .keyboardType(.phonePad)
            
            Button(action: {
                isOnBoarding = false
                print(isOnBoarding)
            }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .background(.blue)
        .padding()
    }
}

// Preview for testing in Xcode's preview canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
