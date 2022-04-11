import Foundation

enum FNDError: Error{
    case infoFailed
    case allNodeDetailsFailed
    case transactionEncodingFailed
    case decodingFailed
}

extension FNDError: CustomDebugStringConvertible{
    public var debugDescription: String{
        switch self{
        case .allNodeDetailsFailed:
            return "unable to get node details for all nodes"
        case .transactionEncodingFailed:
            return "unable to encode transaction"
        case .decodingFailed:
            return "decoding failed"
        case .infoFailed:
            return "Info failed"
        }
    }
}
