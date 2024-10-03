import FetchNodeDetails
import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State var success: Bool = false
    @State private var message = ""
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    Button {
                        execute()
                    } label: {
                        Text("Get-node-details")
                            .foregroundColor(.black)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(success ? "Success" : "Failure"), message: Text(message), dismissButton: .default(Text("Got it!")))
                    }
                }
            }
            .navigationBarTitle("FetchNodeDetail")
            .background(Color.gray)
        }
    }

    func execute() {
        Task {
            let fnd = NodeDetailManager(network: .SAPPHIRE_MAINNET)
            do {
                let val = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
                print(val)
                success = true
                message = val.getTorusNodeEndpoints().joined(separator: ";")
                showAlert = true
            } catch let err {
                success = false
                message = err.localizedDescription
                showAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
