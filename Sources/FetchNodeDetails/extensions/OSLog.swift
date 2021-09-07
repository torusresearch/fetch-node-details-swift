import os.log

//@available(macOS 10.12, iOS 12, *)
//extension OSLog {
//    private static var subsystem = "Torus-fetchNodeDetails"
//
//    /// Logs the view cycles like viewDidLoad.
//    static let nodeDetails = OSLog(subsystem: subsystem, category: "getNodeDetails")
//}


public let subsystem = "com.torus.fetchNodeDetails"

struct Log {
    static let nodeDetails = OSLog(subsystem: subsystem, category: "getNodeDetails")
}
