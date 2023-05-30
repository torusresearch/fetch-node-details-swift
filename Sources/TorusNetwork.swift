import Foundation

public enum TorusNetwork: Equatable, Hashable {
    case SAPPHIRE_DEVNET
    case SAPPHIRE_TESTNET
    case SAPPHIRE_MAINNET
    case MAINNET
    case TESTNET
    case CYAN
    case AQUA
    case CELESTE
    case CUSTOM(path: String)

    public var path: String {
        switch self {
        case .SAPPHIRE_DEVNET:
            return "sapphire_devnet"
        case .SAPPHIRE_TESTNET:
            return "sapphire_testnet"
        case .SAPPHIRE_MAINNET:
            return "sapphire_mainnet"
        case .MAINNET:
            return "mainnet"
        case .TESTNET:
            return "goerli"
        case .CYAN, .AQUA, .CELESTE:
            return "polygon-mainnet"
        case let .CUSTOM(path):
            return path
        }
    }
}
