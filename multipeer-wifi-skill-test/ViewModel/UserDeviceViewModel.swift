//
//  DeviceViewModel.swift
//  multipeer-wifi-skill-test
//
//  Created by Muhammad Aditya Fathur Rahman on 25/05/25.
//

import Foundation
import MultipeerConnectivity

class UserDeviceViewModel: NSObject, ObservableObject {
    private let browser: MCNearbyServiceBrowser
    private let serviceType = "nearby-devices"

    @Published var peers: [PeerDevice] = []
    @Published var joinedPeer: [PeerDevice] = []
    
    override init() {
        let peer = MCPeerID(displayName: UIDevice.current.name)
        browser = MCNearbyServiceBrowser(peer: peer, serviceType: serviceType)
        super.init()
        browser.delegate = self
    }

    func startBrowsing() {
        browser.startBrowsingForPeers()
    }
    
    func finishBrowsing() {
        browser.stopBrowsingForPeers()
    }
    
    func show(peerId: MCPeerID) {
        guard let first = peers.first(where: { $0.peerId == peerId }) else {
            return
        }
        joinedPeer.append(first)
    }
}

extension UserDeviceViewModel: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        peers.append(PeerDevice(peerId: peerID))
    }

    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        peers.removeAll(where: { $0.peerId == peerID })
    }
}
