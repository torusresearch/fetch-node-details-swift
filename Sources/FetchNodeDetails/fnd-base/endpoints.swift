let SAPPHIRE_NETWORK_URLS: [TorusNetwork: [String]] = [
    .sapphireDevnet: [
        "https://sapphire-dev-2-1.authnetwork.dev",
        "https://sapphire-dev-2-2.authnetwork.dev",
        "https://sapphire-dev-2-3.authnetwork.dev",
        "https://sapphire-dev-2-4.authnetwork.dev",
        "https://sapphire-dev-2-5.authnetwork.dev",
    ],
    .sapphireTestnet: [
        "https://lrc1.authnetwork.dev",
        "https://lrc2.authnetwork.dev",
        "https://lrc3.authnetwork.dev",
        "https://lrc4.authnetwork.dev",
        "https://lrc5.authnetwork.dev",
    ],
    .sapphireMainnet: [
        "https://sapphire-1.auth.network",
        "https://sapphire-2.auth.network",
        "https://sapphire-3.auth.network",
        "https://sapphire-4.auth.network",
        "https://sapphire-5.auth.network",
    ],
]

func getSSSEndpoints(network: TorusNetwork) -> [String] {
    guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
        fatalError("Unsupported network: \(network)")
    }

    return endpoints.map { "\($0)/sss/jrpc" }
}

func getRSSEndpoints(network: TorusNetwork) -> [String] {
    guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
        fatalError("Unsupported network: \(network)")
    }

    return endpoints.map { "\($0)/rss" }
}

func getTSSEndpoints(network: TorusNetwork) -> [String] {
    guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
        fatalError("Unsupported network: \(network)")
    }

    return endpoints.map { "\($0)/tss" }
}

