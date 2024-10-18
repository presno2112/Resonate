//
//  View2.swift
//  MultipeerConnection
//
//  Created by Sebastian Presno on 10/10/24.
//

import SwiftUI

struct ResonateView: View {
    @StateObject private var localNetwork = LocalNetworkSessionCoordinator()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        // Other Peers on the Network Section
                        HStack{
                            Text("Available devices")
                                .padding(.horizontal)
                                .padding(.top, 15)
                                .padding(.bottom, 5)
                                .font(.title)
                                .bold()
                                .foregroundStyle(.terciary)
                            Spacer()
                        }
                        Group {
                            Text("Click on the person you want to " ) +
                            Text("Resonate ").bold().foregroundStyle(.terciary) + Text("with")
                        }
                        .font(.system(size: 16))
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                        
                        if !localNetwork.otherDevices.isEmpty {
                            HStack {
                                ForEach(Array(localNetwork.otherDevices), id: \.self) { peerID in
                                    AnimatedPeerBubble(peerName: peerID.displayName) {
                                        // Invite peer and send artist array after connection
                                        localNetwork.invitePeer(peerID: peerID)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                // Lo comente ya que esta usando el ArtistViewModel(), se deberia cambiar
                // para usar el ArtistSwiftData Model
                // Display the first received artist's name (as a test)
//                    Text("\(                 calculateArtistSimilarityPercentage(array1: localNetwork.receivedArtists, array2: ArtistViewModel().artists))%")
//                if let firstArtist = localNetwork.receivedArtists.first {
//                    Text("Received Artist: \(firstArtist.name)")
//                        .padding()
//                        .font(.headline)
//                } else {
//                    Text("No artist received yet")
//                        .padding()
//                        .font(.headline)
//                }
            }
        }
        .onAppear {
            localNetwork.startBrowsing()
            localNetwork.startAdvertising()
        }
        .onDisappear {
            localNetwork.stopBrowsing()
            localNetwork.stopAdvertising()
        }
    }
}

// A separate view to represent a "bubble" for a peer with animation
struct AnimatedPeerBubble: View {
    var peerName: String
    var action: () -> Void
    
    @State private var scaleEffect: CGFloat = 0.0
    @State private var opacity: Double = 0.0
    
    var body: some View {
        VStack {
            Button(action: action) {
                ZStack {
                    Circle()
                        .fill(.aux1)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 4)
                        Image(systemName: "person.fill")
                        .font(.system(size: 60))
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .foregroundStyle(.aux2)
                        .scaleEffect(scaleEffect)
                        .opacity(opacity)
                }
                .padding(.horizontal)
            }
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)) {
                    scaleEffect = 1.0
                    opacity = 1.0
                }
            }
            Text(peerName)
                .foregroundColor(.terciary)
                .font(.subheadline)
                .bold()
                .padding(5)
        }
    }
}

#Preview {
    ResonateView()
}
