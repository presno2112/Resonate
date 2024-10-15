//
//  LoginView.swift
//  Resonate
//
//  Created by Matteo Merola on 15/10/24.
//

import SwiftUI

struct  SignUpView: View {
    var body: some View {
    
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                
            Text("Resonate")
                .foregroundStyle(Color.app)
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .font(.system(size: 38))
                .padding(.top, -40)
                .padding(.bottom, 50)
           
            
            Text("Name")
                .foregroundStyle(Color.app)
                .padding(.trailing, 250)
                .padding(.top, -30)
                .font(.system(size: 20))
                .padding(.top, 30)
            
            TextField("", text: .constant(""))
                .padding(.vertical, -9)
                .padding()
                .background(Color.textField)
                    .cornerRadius(100)
                    .padding()
                    .padding(.top, -20)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
            
            
            Text("Username")
                .foregroundStyle(Color.app)
                .padding(.trailing, 212)
                .font(.system(size: 20))
            
            TextField("", text: .constant(""))
                .padding(.vertical, -9)
                .padding()
                .background(Color.textField)
                    .cornerRadius(100)
                    .padding()
                    .padding(.top, -20)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
            
            Text("Password")
                .foregroundStyle(Color.app)
                .padding(.trailing, 220)
                .font(.system(size: 20))
            
            TextField("", text: .constant(""))
                .padding(.vertical, -9)
                .padding()
                .background(Color.textField)
                .cornerRadius(100)
                .padding()
                .padding(.top, -20)
                .padding(.leading, 25)
                .padding(.trailing, 25)
            
                Text("Confirm Password")
                .foregroundStyle(Color.app)
                .padding(.trailing, 158)
                .padding(.top, -30)
                .font(.system(size: 18))
                .padding(.top, 30)
            
            TextField("", text: .constant(""))
                .padding(.vertical, -9)
                .padding()
                .background(Color.textField)
                .cornerRadius(100)
                .padding()
                .padding(.top, -27)
                .padding(.leading, 25)
                .padding(.trailing, 25)
                    
                    
            
            
            Button(action: {}) {
                Text("Sign Up")
                    .foregroundStyle(Color.textField)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 70)
                    .background(.app)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 25)
            }
        }
    }
}

#Preview {
    SignUpView()
}
