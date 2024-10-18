//
//  ResultsView.swift
//  Resonate
//
//  Created by Sebastian Presno on 17/10/24.
//

import SwiftUI

struct ResultsView: View {
    @State private var percentage: CGFloat = 0.0
    @StateObject private var localNetwork = LocalNetworkSessionCoordinator()
    
    var targetPercentage: CGFloat
    
    var body: some View {
        VStack {
            Spacer()
            Group{
                Text("Username ").bold().foregroundStyle(Color("terciary")) +
                Text("and ") + Text("Username\n ").bold().foregroundStyle(Color("terciary")) + Text("level of resonation is")
            }
            .padding()
            .font(.title2)
            .multilineTextAlignment(.center)
            Spacer()
            ZStack {
                Circle()
                    .stroke(lineWidth: 30)
                    .foregroundStyle(Color("aux2"))
                
                Circle()
                    .trim(from: 0.0, to: percentage / 100)
                    .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                    .foregroundStyle(Color("terciary"))
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 3), value: percentage)
                
                Text(String(format: "%.0f%%", min(self.percentage, 100.0)))
                    .font(.system(size: 50, weight: .bold))
                    .foregroundStyle(Color("terciary"))
            }
            .frame(width: 200, height: 200)
            
            VStack {
                Group{
                    Text("Your musical tastes are in ")
                        .font(.body) +
                    Text("perfect harmony ")
                        .font(.body)
                        .bold()
                        .foregroundStyle(Color("terciary")) +
                    Text("making it easy to share and discover new favorite tracks together.")
                }
                .padding()
                .multilineTextAlignment(.center)
            }
            .padding(.top, 30)
            Spacer()
            Button("Save results"){
                localNetwork.isConnected = false
            }
            .buttonStyle(CustomButtonDark())
            .frame(width: 200)
            Spacer()
        }
        .onAppear {
            withAnimation {
                self.percentage = targetPercentage
            }
        }
    }
}

#Preview {
    ResultsView(targetPercentage: 50)
}
