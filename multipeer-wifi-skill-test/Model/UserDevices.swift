//
//  UserDevices.swift
//  multipeer-wifi-skill-test
//
//  Created by Muhammad Aditya Fathur Rahman on 25/05/25.
//

import Foundation
import MultipeerConnectivity

struct PeerDevice: Identifiable, Hashable {
    let id = UUID()
    let peerId: MCPeerID
}

struct RequestDevice: Identifiable {
    let id = UUID()
    let peerId: MCPeerID
    let onRequest: (Bool) -> Void
}
