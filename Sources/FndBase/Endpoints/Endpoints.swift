let SAPPHIRE_NETWORK_URLS: [SapphireNetwork: [String]] = [
    .SAPPHIRE_DEVNET: [
        "https://node-1.dev-node.web3auth.io",
        "https://node-2.dev-node.web3auth.io",
        "https://node-3.dev-node.web3auth.io",
        "https://node-4.dev-node.web3auth.io",
        "https://node-5.dev-node.web3auth.io",
    ],
    .SAPPHIRE_MAINNET: [
        "https://node-1.node.web3auth.io",
        "https://node-2.node.web3auth.io",
        "https://node-3.node.web3auth.io",
        "https://node-4.node.web3auth.io",
        "https://node-5.node.web3auth.io",
    ],
]

func getSSSEndpoints(network: TorusNetwork) throws -> [String] {
    switch network {
        case .sapphire(let network) :
            
            guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
                fatalError("Unsupported network: \(network)")
            }
            
            return endpoints.map { "\($0)/sss/jrpc" }
        case .legacy(let network ) :
            let routeIdentifier = network.migration_map
                    
            guard let endpoints = SAPPHIRE_NETWORK_URLS[routeIdentifier.networkMigratedTo] else {
                throw FetchNodeError.InvalidMigrationNetwork(routeIdentifier.networkMigratedTo.path)
            }
        
            if ( routeIdentifier.migrationCompleted) {
                return endpoints.map{ "\($0)/sss/\(routeIdentifier.networkIdentifier)/jrpc" };
            } else {
                return endpoints.map { "\($0)/sss/jrpc" }
            }
    }
}

func getRSSEndpoints(network: TorusNetwork) throws -> [String] {
    switch network {
        case .sapphire(let network) :
            
            guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
                fatalError("Unsupported network: \(network)")
            }
            
            return endpoints.map { "\($0)/rss" }
        case .legacy(let network ) :
            let routeIdentifier = network.migration_map
        
            guard let endpoints = SAPPHIRE_NETWORK_URLS[routeIdentifier.networkMigratedTo] else {
                throw FetchNodeError.InvalidMigrationNetwork(routeIdentifier.networkMigratedTo.path)
            }
            if ( routeIdentifier.migrationCompleted) {
                return endpoints.map{ "\($0)/rss/\(routeIdentifier.networkIdentifier)" };
            }
            return endpoints.map { "\($0)/rss" }
            
    }
}

func getTSSEndpoints(network: TorusNetwork) throws -> [String] {
    switch network {
        case .sapphire(let network) :
            
            guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
                fatalError("Unsupported network: \(network)")
            }
            
            return endpoints.map { "\($0)/tss" }
        case .legacy(let network ) :
            let routeIdentifier = network.migration_map
        
            guard let endpoints = SAPPHIRE_NETWORK_URLS[routeIdentifier.networkMigratedTo] else {
                throw FetchNodeError.InvalidMigrationNetwork(routeIdentifier.networkMigratedTo.path)
            }
            if ( routeIdentifier.migrationCompleted) {
                return endpoints.map{ "\($0)/tss/\(routeIdentifier.networkIdentifier)" };
            }
            return endpoints.map { "\($0)/tss" }
    }
}



