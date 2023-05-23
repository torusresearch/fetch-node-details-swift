func fetchLocalConfig(network: TORUS_NETWORK_TYPE) -> AllNodeDetailsModel? {
    switch network {
        case TORUS_NETWORK["SAPPHIRE_DEVNET"]:
            return NODE_DETAILS_SAPPHIRE_DEVNET
        case TORUS_NETWORK["SAPPHIRE_TESTNET"]:
            return NODE_DETAILS_SAPPHIRE_TESTNET
        case TORUS_NETWORK["SAPPHIRE_MAINNET"]:
            return NODE_DETAILS_SAPPHIRE_MAINNET
        case TORUS_NETWORK["MAINNET"]:
            return NODE_DETAILS_MAINNET
        case TORUS_NETWORK["TESTNET"]:
            return NODE_DETAILS_TESTNET
        default:
            return nil
    }
}
