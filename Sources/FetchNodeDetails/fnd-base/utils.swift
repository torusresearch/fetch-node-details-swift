func fetchLocalConfig(network: TorusNetwork) -> AllNodeDetailsModel? {
    switch network {
        case .sapphireDevnet:
                return NODE_DETAILS_SAPPHIRE_DEVNET
        case .sapphireTestnet:
                return NODE_DETAILS_SAPPHIRE_TESTNET
        case .sapphireMainnet:
                return NODE_DETAILS_SAPPHIRE_MAINNET
        case .MAINNET:
                return NODE_DETAILS_MAINNET
        case .TESTNET:
                return NODE_DETAILS_TESTNET
        default:
            return nil
    }
}
