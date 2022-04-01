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
                    Group{
                        Button(action: {
                            let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: .MAINNET)
                            fnd.getCurrentEpochPromise().done{ data in
                                self.currentEpoch = data
                                self.showingAlert = true
                                print(self.currentEpoch)
                            }.catch{error in
                                print(error)
                            }
                        }, label: {
                            Text("Get current epoch")
                        }).alert(isPresented: $showingAlert) {
                            Alert(title: Text("Current Epoch"), message: Text(self.currentEpoch.description), dismissButton: .default(Text("Got it!")))
                        }
                    }temp
                    
                }
                
            }.navigationBarTitle(Text("Fetch node details"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
