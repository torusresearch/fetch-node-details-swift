import Foundation

public enum EthereumNetworkFND : Equatable{
    case MAINNET
    case ROPSTEN
    case POLYGON
    case AQUA
    case CUSTOM(path : String)
    
    var path : String{
        switch self {
        case .MAINNET:
            return "mainnet"
        case .ROPSTEN:
            return "ropsten"
        case .POLYGON:
            return "polygon-mainnet"
        case .AQUA:
            return "polygon-mainnet"
        case .CUSTOM(let path):
            return "\(path)"
       
        }
    }
}


