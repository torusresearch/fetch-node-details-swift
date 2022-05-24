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
        NavigationView{
            List {
                Section(header: Text("APIs")) {
                    
                }
                
            }.navigationBarTitle(Text("Fetch node details"))
            
        }.onAppear {
           // execute()
        }
    }
    
    func execute(){
            let fnd = FetchNodeDetails(proxyAddress : "0xf20336e16B5182637f09821c27BDe29b0AFcfe80", network: .MAINNET)
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
