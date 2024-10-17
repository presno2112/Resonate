//
//  LoginView.swift
//  Resonate
//
//  Created by Matteo Merola on 15/10/24.
//

import SwiftUI

struct  SignUpView: View {
    @Environment(\.modelContext) var context
    @State var name: String = ""
    @State var username: String = ""
    var body: some View {
    
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
                
            Text("Resonate")
                .foregroundStyle(Color("primary"))
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .font(.system(size: 38))
                .padding(.top, -40)
           
            Spacer()
            Text("Name")
                .foregroundStyle(Color("primary"))
                .padding(.trailing, 250)
                .padding(.top, -30)
                .font(.system(size: 20))
                .padding(.top, 30)
            
            TextField("", text: $name)
                .padding(.vertical, -6)
                .padding()
                .background(Color("aux2"))
                    .cornerRadius(100)
                    .padding()
                    .padding(.top, -30)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
            
            
            Text("Username")
                .foregroundStyle(Color("primary"))
                .padding(.trailing, 220)
                .padding(.top, -30)
                .font(.system(size: 20))
                .padding(.top, 30)
            
            
            TextField("", text: $username)
                .padding(.vertical, -6)
                .padding()
                .background(Color("aux2"))
                .cornerRadius(100)
                .padding()
                .padding(.top, -27)
                .padding(.leading, 25)
                .padding(.trailing, 25)
            
                    
            
            Button("Sign Up"){
                // Codigo para crear el usuario y agregarlo al modelo de SwiftData
                // al hacer sign up
                let newUser = UserSwiftData(name: name, username: username, artists: [])
                context.insert(newUser)
            }
            .buttonStyle(CustomButtonDark())
            .frame(width: 200)
            .padding()
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    SignUpView()
}
