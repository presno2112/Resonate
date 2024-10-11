//
//  ContentView.swift
//  Resonate
//
//  Created by Sebastian Presno on 09/10/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            ProfilePic()
                .padding(.top, 65)
            CarouselView()
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
