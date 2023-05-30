func fetchLocalConfig(network: TorusNetwork) -> AllNodeDetailsModel? {
    switch network {
        case .SAPPHIRE_DEVNET:
                return NODE_DETAILS_SAPPHIRE_DEVNET
        case .SAPPHIRE_TESTNET:
                return NODE_DETAILS_SAPPHIRE_TESTNET
        case .SAPPHIRE_MAINNET:
                return NODE_DETAILS_SAPPHIRE_MAINNET
        case .MAINNET:
                return NODE_DETAILS_MAINNET
        case .TESTNET:
                return NODE_DETAILS_TESTNET
        default:
            return nil
    }
}
