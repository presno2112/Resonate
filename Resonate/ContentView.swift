//
//  ContentView.swift
//  Resonate
//
//  Created by Sebastian Presno on 09/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ProfileView()
                .padding(.top, 65)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
