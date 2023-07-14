import CommonSources

public func fetchLocalConfig(network: TorusNetwork) throws -> AllNodeDetailsModel? {
    
    switch network {
        case .legacy(let network ) :
            return try LegacyConfig(network: network)
        
        case .sapphire(let network) :
            return try SapphireConfig(network: network)
    }
}

