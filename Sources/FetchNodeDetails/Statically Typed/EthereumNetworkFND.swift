import Foundation

public enum EthereumNetworkFND : Equatable{
    case MAINNET
    case ROPSTEN
    case POLYGON
    case CUSTOM(path : String)
    
    public var path : String{
        switch self {
        case .MAINNET:
            return "mainnet"
        case .ROPSTEN:
            return "ropsten"
        case .POLYGON:
            return "polygon-mainnet"
        case .CUSTOM(let path):
            return "\(path)"
        }
    }
}


