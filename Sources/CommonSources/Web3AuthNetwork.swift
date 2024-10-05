public enum Web3AuthNetwork : Equatable, Hashable {
    case SAPPHIRE_DEVNET
    case SAPPHIRE_MAINNET
    case MAINNET
    case TESTNET
    case CYAN
    case AQUA
    case CELESTE
    
    public var path: String {
        return self.torusNetwork.path
    }
    
    public var name: String {
        return self.torusNetwork.name
    }
    
    public var signerMap: String {
        return self.torusNetwork.signerMap
    }
    
    public var isLegacy: Bool {
        if case .legacy(_) = torusNetwork {
           return true
        }
        return false
    }
    
    public var isSapphire: Bool {
        if case .sapphire(_) = torusNetwork {
           return true
        }
        return false
    }
    
    public var metadataMap: String {
        get throws {
            if case .legacy(let legacyNetwork) = torusNetwork {
                return legacyNetwork.metadataMap
            }
            
            if case .sapphire(let sapphireNetwork) = torusNetwork {
                if sapphireNetwork == .SAPPHIRE_MAINNET {
                    return "https://node-1.node.web3auth.io/metadata"
                } else {
                    return "https://node-1.dev-node.web3auth.io/metadata"
                }
            }
            
            throw FetchNodeError.InvalidNetwork(self.name)
        }
    }
    
    
    internal var torusNetwork: TorusNetwork {
        switch self {
        case .SAPPHIRE_DEVNET:
            return .sapphire(.SAPPHIRE_DEVNET)
        case .SAPPHIRE_MAINNET:
            return .sapphire(.SAPPHIRE_MAINNET)
        case .MAINNET:
            return .legacy(.MAINNET)
        case .TESTNET:
            return .legacy(.TESTNET)
        case .CYAN:
            return .legacy(.CYAN)
        case .AQUA:
            return .legacy(.AQUA)
        case .CELESTE:
            return .legacy(.CELESTE)
        }
    }
}
