//
//  LoginView.swift
//  Resonate
//
//  Created by Matteo Merola on 15/10/24.
//

import SwiftUI

struct  SignUpView: View {
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
            
            TextField("", text: .constant(""))
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
            
            
            TextField("", text: .constant(""))
                .padding(.vertical, -6)
                .padding()
                .background(Color("aux2"))
                .cornerRadius(100)
                .padding()
                .padding(.top, -27)
                .padding(.leading, 25)
                .padding(.trailing, 25)
            
                    
            
            Button("Sign Up"){
                
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
