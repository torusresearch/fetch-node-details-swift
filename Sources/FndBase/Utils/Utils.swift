import CommonSources

public func fetchLocalConfig(network: TorusNetwork) throws -> AllNodeDetailsModel? {
    
    switch network {
        case .legacy(let network ) :
            return try LegacyConfig(network: network)
        
        case .sapphire(let network) :
            return try SapphireConfig(network: network)
    }
//
//    switch network {
//        case .SAPPHIRE_DEVNET:
//                return NODE_DETAILS_SAPPHIRE_DEVNET
//        case .SAPPHIRE_TESTNET:
//                return NODE_DETAILS_SAPPHIRE_TESTNET
//        case .SAPPHIRE_MAINNET:
//                return NODE_DETAILS_SAPPHIRE_MAINNET
//        case .MAINNET, .CYAN, .AQUA, .CELESTE:
//                return NODE_DETAILS_MAINNET
//        case .TESTNET:
//                return NODE_DETAILS_TESTNET
//        default:
//            return nil
//    }
}

