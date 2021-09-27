import os.log
import Foundation

//@available(macOS 10.12, iOS 12, *)
//extension OSLog {
//    private static var subsystem = "Torus-fetchNodeDetails"
//
//    /// Logs the view cycles like viewDidLoad.
//    static let nodeDetails = OSLog(subsystem: subsystem, category: "getNodeDetails")
//}


public let subsystem = Bundle.main.bundleIdentifier ?? "com.torus.fetchNodeDetails"

public struct FNDLogger {
    static let inactiveLog = OSLog.disabled
    static let core = OSLog(subsystem: subsystem, category: "core")
    static let network = OSLog(subsystem: subsystem, category: "network")
}

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
func getTorusLogger(log: OSLog = .default, type: OSLogType = .default) -> OSLog {
    var logCheck: OSLog { fndLogType.rawValue <= type.rawValue ? log : FNDLogger.inactiveLog}
    return logCheck
}

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
func log(_ message: StaticString, dso: UnsafeRawPointer? = #dsohandle, log: OSLog = .default, type: OSLogType = .default, _ args: CVarArg...){
    var logCheck: OSLog { fndLogType.rawValue <= type.rawValue ? log : FNDLogger.inactiveLog}
    os_log(message, dso: dso, log: logCheck, type: type, args)
}
