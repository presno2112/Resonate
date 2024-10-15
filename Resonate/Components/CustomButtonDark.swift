//
//  CustomButton1.swift
//  Resonate
//
//  Created by Sebastian Presno on 15/10/24.
//

import SwiftUI

struct CustomButtonDark: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(Color("terciary"))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("aux1"))
            .clipShape(RoundedRectangle(cornerRadius: 80))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .shadow(radius: configuration.isPressed ? 0 : 5)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
