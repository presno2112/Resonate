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
                    VStack(spacing: 20) {
                        // Other Peers on the Network Section
                        if !localNetwork.otherDevices.isEmpty {
                            Text("On my network")
                                .font(.headline)
                                .padding(.top)
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
                .navigationTitle("Local Chat")
                
                // Display the first received artist's name (as a test)
                    Text("\(                 calculateArtistSimilarityPercentage(array1: localNetwork.receivedArtists, array2: ArtistViewModel().artists))%")
                if let firstArtist = localNetwork.receivedArtists.first {
                    Text("Received Artist: \(firstArtist.name)")
                        .padding()
                        .font(.headline)
                } else {
                    Text("No artist received yet")
                        .padding()
                        .font(.headline)
                }
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
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Text(peerName)
                                .foregroundColor(.white)
                                .bold()
                        )
                        .scaleEffect(scaleEffect)
                        .opacity(opacity)
                        .shadow(radius: 10)
                }
                .onAppear {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)) {
                        scaleEffect = 1.0
                        opacity = 1.0
                    }
                }
            }
        }
    }
}

#Preview {
    ResonateView()
}
