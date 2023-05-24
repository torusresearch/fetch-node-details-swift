import Foundation

public enum TorusNetwork: Equatable, Hashable {
    case sapphireDevnet
    case sapphireTestnet
    case sapphireMainnet
    case MAINNET
    case TESTNET
    case CYAN
    case AQUA
    case CELESTE
    case CUSTOM(path: String)

    public var path: String {
        switch self {
        case .sapphireDevnet:
            return "sapphire_devnet"
        case .sapphireTestnet:
            return "sapphire_testnet"
        case .sapphireMainnet:
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
