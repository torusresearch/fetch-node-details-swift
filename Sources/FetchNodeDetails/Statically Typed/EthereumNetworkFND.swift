import Foundation

public enum EthereumNetworkFND: Equatable {
    case MAINNET
    ///Name changed Ropsten to Testnet
    case TESTNET
    /// Name changed from Polygon to Cyan
    case CYAN
    case AQUA
    case CELESTE
    case CUSTOM(path: String)

    public var path: String {
        switch self {
        case .MAINNET:
            return "mainnet"
        case .TESTNET:
            return "goerli"
        case .CYAN:
            return "polygon-mainnet"
        case .AQUA:
            return "polygon-mainnet"
        case .CELESTE:
            return "polygon-mainnet"
        case let .CUSTOM(path):
            return "\(path)"
        }
    }
}
