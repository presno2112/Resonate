//
//  AvailableDevicesView.swift
//  Resonate
//
//  Created by Matteo Merola on 17/10/24.
//

import SwiftUI

struct AvailableDevicesView: View {
    
    let resonate = "Resonate"
    
    var body: some View {
        
        VStack {
            
            Text("Available devices")
                .font(.system(size: 30))
                .foregroundStyle(.app)
                .padding(.trailing, 110)
                .fontWeight(.bold)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            Text("Click on the person you want to ")
            + Text(resonate)
                .foregroundStyle(.app)
                .fontWeight(.bold)
            + Text(" with")
            Spacer()
        }
        
        HStack {
            
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(.devcolor)
                
            
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(.textField)
                
            
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(.devcolor)
               
            
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(.textField)
       
        }
        Spacer()
        
        VStack {
            Text("Name of the device")
                .font(.system(size: 8))
                .foregroundStyle(.app)
                .padding(.bottom, 550)
                .padding(.trailing, 270)
           
                
        }
            
             
            
                
                
        }
            
              }
        
   


#Preview {
    AvailableDevicesView()
}
