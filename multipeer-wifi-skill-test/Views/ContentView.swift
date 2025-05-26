//
//  ContentView.swift
//  multipeer-wifi-skill-test
//
//  Created by Muhammad Aditya Fathur Rahman on 25/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserDeviceViewModel()

    var body: some View {
        NavigationStack(path: $viewModel.joinedPeer) {
            VStack(alignment: .leading, spacing: 10) {
                List(viewModel.peers) { peer in
                    VStack {
                        Text(peer.peerId.displayName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(peer.id.uuidString)
                            .fontWeight(.light)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 5)
                }
                .navigationTitle("Nearby Devices")
                
                Spacer()
                
                HStack {
                    Text("Searching nearby devices...")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.leading, 30)
                    
                    Spacer()
                }
                
                Spacer()
                
            }
            .onAppear {
                viewModel.startBrowsing()
            }
            .onDisappear {
                viewModel.finishBrowsing()
            }
        }
    }
}
