//
//  BioArtistsView.swift
//  Resonate
//
//  Created by Matteo Merola on 16/10/24.
//

import SwiftUI

struct BioArtistsView: View {
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.textField)
                .padding(.bottom, 500)
                .padding(.top, 100)
            
            Circle()
               .scaledToFit()
               .frame(width: 150 , height: 150)
               .foregroundStyle(.bioa)
               .padding(.bottom, 270)
            
            Text("Name of the Artist")
                .font(.title)
                .padding(.bottom, 40)
                .foregroundStyle(.app)
                .fontWeight(.bold)
            
            Text("Description of the Artist")
                .padding(.top, 100)
                .font(.system(size: 20))
               
        
        }
        
       
               
            
          
          
        }
    }


#Preview {
    BioArtistsView()
}
