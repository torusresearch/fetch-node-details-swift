//
//  ContentView.swift
//  cptest
//
//  Created by Shubham on 12/6/20.
//  Copyright © 2020 torus. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        NavigationView{
            List {
                Section(header: Text("APIs")) {
                    Group{
                        Button(action: {
                            self.showingAlert = true
                        }, label: {
                            Text("Get current epoch")
                        }).alert(isPresented: $showingAlert) {
                            Alert(title: Text("Important message"), message: Text("blublu"), dismissButton: .default(Text("Got it!")))
                        }
                    }
                    
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
