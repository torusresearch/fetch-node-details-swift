import CommonSources

let TORUS_NETWORK: [TorusNetwork: String] = [
    TorusNetwork.sapphire(SapphireNetwork.SAPPHIRE_DEVNET) : "sapphire_devnet",
    TorusNetwork.sapphire(SapphireNetwork.SAPPHIRE_MAINNET) : "sapphire_mainnet",
    TorusNetwork.legacy(LegacyNetwork.MAINNET) : "mainnet",
    TorusNetwork.legacy(LegacyNetwork.TESTNET) : "testnet",
    TorusNetwork.legacy(LegacyNetwork.CYAN) : "cyan",
    TorusNetwork.legacy(LegacyNetwork.CELESTE) : "celeste",
]
public typealias TORUS_NETWORK_TYPE = String


let MULTI_CLUSTER_NETWORKS: [LegacyNetwork] = [.CELESTE]

let NETWORK_MAP: [LegacyNetwork: String] = [
    .MAINNET: "mainnet",
    .TESTNET: "goerli",
    .CYAN: "polygon-mainnet",
    .AQUA: "polygon-mainnet",
    .CELESTE: "polygon-mainnet"
]

let SIGNER_MAP: [LegacyNetwork: String] = [
    .MAINNET: "https://signer.tor.us",
    .TESTNET: "https://signer.tor.us",
    .CYAN: "https://signer-polygon.tor.us",
    .AQUA: "https://signer-polygon.tor.us",
    .CELESTE: "https://signer-polygon.tor.us"
]
