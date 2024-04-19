public func fetchLocalConfig(network: TorusNetwork) throws -> AllNodeDetailsModel? {
    
    switch network {
        case .legacy(let network ) :
        if (network.migration_map.migrationCompleted) {
            return try SapphireConfig(network: network.migration_map.networkMigratedTo )
        }
        return nil
    
        case .sapphire(let network) :
            return try SapphireConfig(network: network)
    }
}

