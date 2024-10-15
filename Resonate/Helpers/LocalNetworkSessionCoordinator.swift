//
//  LocalNetworkSessionCoordinator.swift
//  Resonate
//
//  Created by Sebastian Presno on 13/10/24.
//

import Foundation
import MultipeerConnectivity

class LocalNetworkSessionCoordinator: NSObject, ObservableObject, MCSessionDelegate {
    private let advertiser: MCNearbyServiceAdvertiser
    private let browser: MCNearbyServiceBrowser
    private let session: MCSession
    
    @Published private(set) var allDevices: Set<MCPeerID> = []
    @Published private(set) var connectedDevices: Set<MCPeerID> = []
    @Published private(set) var receivedArtists: [Artist] = [] // Received array of artists
    var otherDevices: Set<MCPeerID> {
        return allDevices.subtracting(connectedDevices)
    }
    
    @Published var artistsToSend: [Artist] = Artist.sampleData // Artists to send
    
    init(peerID: MCPeerID = .init(displayName: UIDevice.current.name)) {
        advertiser = .init(peer: peerID, discoveryInfo: nil, serviceType: "sendArtists")
        browser = .init(peer: peerID, serviceType: "sendArtists")
        session = .init(peer: peerID)
        super.init()
        
        browser.delegate = self
        advertiser.delegate = self
        session.delegate = self
    }
    
    public func startAdvertising() {
        advertiser.startAdvertisingPeer()
    }
    
    public func stopAdvertising() {
        advertiser.stopAdvertisingPeer()
    }
    
    public func startBrowsing() {
        browser.startBrowsingForPeers()
    }
    
    public func stopBrowsing() {
        browser.stopBrowsingForPeers()
    }
    
    public func invitePeer(peerID: MCPeerID) {
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 120)
    }
    
    // Send artist array to a peer
    public func sendArtists(to peerID: MCPeerID) throws {
        let encoder = JSONEncoder()
        let artistData = try encoder.encode(artistsToSend) // Convert array to Data
        try session.send(artistData, toPeers: [peerID], with: .reliable)
    }
    
    // MARK: - MCSessionDelegate Methods
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        DispatchQueue.main.async {
            if state == .connected {
                self.connectedDevices.insert(peerID)
                
                // Automatically send artists to the connected peer
                try? self.sendArtists(to: peerID)
            } else {
                self.connectedDevices.remove(peerID)
            }
            self.objectWillChange.send() // Notify SwiftUI to update the view
        }
    }
    
    // Handle received data
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let decoder = JSONDecoder()
        if let receivedArtists = try? decoder.decode([Artist].self, from: data) {
            DispatchQueue.main.async {
                self.receivedArtists = receivedArtists
                self.objectWillChange.send()  // Notify SwiftUI to update the view
            }
        }
    }
    
    // Required MCSessionDelegate methods (empty for now)
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {}
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {}
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {}
}

extension LocalNetworkSessionCoordinator: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}

extension LocalNetworkSessionCoordinator: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        DispatchQueue.main.async {
            self.allDevices.insert(peerID)
            self.objectWillChange.send()  // Notify SwiftUI to update the view
        }
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        DispatchQueue.main.async {
            self.allDevices.remove(peerID)
            self.objectWillChange.send()  // Notify SwiftUI to update the view
        }
    }
}
