let TORUS_NETWORK: [TorusNetwork: String] = [
    TorusNetwork.sapphire(SapphireNetwork.SAPPHIRE_DEVNET) : "sapphire_devnet",
    TorusNetwork.sapphire(SapphireNetwork.SAPPHIRE_MAINNET) : "sapphire_mainnet",
    TorusNetwork.legacy(LegacyNetwork.MAINNET) : "mainnet",
    TorusNetwork.legacy(LegacyNetwork.TESTNET) : "testnet",
    TorusNetwork.legacy(LegacyNetwork.CYAN) : "cyan",
    TorusNetwork.legacy(LegacyNetwork.CELESTE) : "celeste",
]
public typealias TORUS_NETWORK_TYPE = String


let MULTI_CLUSTER_NETWORKS: [LegacyNetwork] = []
