//
//  ContentView.swift
//  cptest
//
//  Created by Shubham on 12/6/20.
//  Copyright © 2020 torus. All rights reserved.
//

import SwiftUI
import FetchNodeDetails

struct ContentView: View {
    @State private var showingAlert = false
    @State private var currentEpoch = 0
    var body: some View {
        VStack{
            Button {
                execute()
            } label: {
                Text("Fetch-node-details")
            }

        }
    }
    
    func execute(){
            let fnd = FetchNodeDetails(proxyAddress : "0x9f072ba19b3370e512aa1b4bfcdaf97283168005", network: .MAINNET)
            fnd.getNodeDetails(verifier : "google", verifierID : "hello@tor.us").done { result in
               print(result)
            }.catch { error in
                print(error)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
