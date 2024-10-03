public func fetchLocalConfig(network: Web3AuthNetwork) throws -> NodeDetails {
    
    switch network {
    case .AQUA,.CELESTE,.CYAN,.MAINNET,.TESTNET :
        if (network.migration_map.migrationCompleted) {
            return try SapphireConfig(network: network.migration_map.networkMigratedTo )!
        }
        throw FetchNodeError.InvalidNetwork("Unsupported network: \(network)")
    case .SAPPHIRE_DEVNET, .SAPPHIRE_MAINNET :
            return try SapphireConfig(network: network)!
    }
    
}

