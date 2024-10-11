//
//  ContentView.swift
//  Resonate
//
//  Created by Sebastian Presno on 08/10/24.
//

import SwiftUI

struct ProfilePic: View {
    @State var fullname: String = ""
    @State var username: String = ""
    @State var description: String = ""
    @State var profileImage: Image?
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 330, height: 180)
            if let profileImage = profileImage {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .offset(y: -100)
            } else {
                ZStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 150, height: 150)
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                }
                .offset(y: -100)
            }
            VStack {
                Text(fullname)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text(username)
                    .foregroundColor(.white)
                    .padding(.bottom)
                Text(description)
                    .foregroundColor(.white)
            }
            .padding(.top, 40)
        }
        .padding()
    }
}

#Preview {
    ProfilePic()
}
