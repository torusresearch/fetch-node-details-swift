let TORUS_NETWORK: [TorusNetwork: String] = [
    .sapphireDevnet: "sapphire_devnet",
    .sapphireTestnet: "sapphire_testnet",
    .sapphireMainnet: "sapphire_mainnet",
    .MAINNET: "mainnet",
    .TESTNET: "testnet",
    .CYAN: "cyan",
    .AQUA: "aqua",
    .CELESTE: "celeste"
]
public typealias TORUS_NETWORK_TYPE = String

let PROXY_CONTRACT_ADDRESS: [TorusNetwork: String] = [
    .MAINNET: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80",
    .TESTNET: "0xd084604e5FA387FbC2Da8bAab07fDD6aDED4614A",
    .CYAN: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005",
    .AQUA: "0x29Dea82a0509153b91040ee13cDBba0f03efb625",
    .CELESTE: "0x6Bffb4e89453069E7487f0fa5c9f4a2D771cce6c"
]

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
