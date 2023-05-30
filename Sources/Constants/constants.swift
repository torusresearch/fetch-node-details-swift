let TORUS_NETWORK: [TorusNetwork: String] = [
    .SAPPHIRE_DEVNET: "sapphire_devnet",
    .SAPPHIRE_TESTNET: "sapphire_testnet",
    .SAPPHIRE_MAINNET: "sapphire_mainnet",
    .MAINNET: "mainnet",
    .TESTNET: "testnet",
    .CYAN: "cyan",
    .AQUA: "aqua",
    .CELESTE: "celeste"
]
public typealias TORUS_NETWORK_TYPE = String


let MULTI_CLUSTER_NETWORKS: [TorusNetwork] = [.AQUA, .CELESTE, .CYAN]

let NETWORK_MAP: [TorusNetwork: String] = [
    .MAINNET: "mainnet",
    .TESTNET: "goerli",
    .CYAN: "polygon-mainnet",
    .AQUA: "polygon-mainnet",
    .CELESTE: "polygon-mainnet"
]

let SIGNER_MAP: [TorusNetwork: String] = [
    .MAINNET: "https://signer.tor.us",
    .TESTNET: "https://signer.tor.us",
    .CYAN: "https://signer-polygon.tor.us",
    .AQUA: "https://signer-polygon.tor.us",
    .CELESTE: "https://signer-polygon.tor.us"
]
