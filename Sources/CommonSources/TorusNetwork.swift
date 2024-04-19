import Foundation

public enum TorusNetwork : Equatable, Hashable {
    case legacy(LegacyNetwork)
    case sapphire(SapphireNetwork)
    
    public var name : String {
        switch self {
        case .legacy(let network) :
            return network.name
        case .sapphire(let network) :
            return network.name
        }
    }
    
    public var path : String {
        switch self {
        case .legacy(let network) :
            return network.path
        case .sapphire(let network) :
            return network.path
        }
    }
    
    public var signerMap :  String {
        switch self {
        case .legacy(let network) :
            return network.signerMap
        case .sapphire(let network) :
            return network.signerMap
        }
    }
}

public enum SapphireNetwork: Equatable, Hashable {
    case SAPPHIRE_DEVNET
    case SAPPHIRE_MAINNET

    public var path: String {
        switch self {
        case .SAPPHIRE_DEVNET:
            return "sapphire_devnet"
        case .SAPPHIRE_MAINNET:
            return "sapphire_mainnet"
        }
    }
    
    public var name: String {
        switch self {
        case .SAPPHIRE_DEVNET:
            return "sapphire_devnet"
        case .SAPPHIRE_MAINNET:
            return "sapphire_mainnet"
        }
    }
    
    public var signerMap : String {
        switch self {
        case .SAPPHIRE_MAINNET: return "https://signer.web3auth.io"
        case .SAPPHIRE_DEVNET: return "https://signer.web3auth.io"
        }
    }
}

public enum LegacyNetwork: Equatable, Hashable {
    case MAINNET
    case TESTNET
    case CYAN
    case AQUA
    case CELESTE
    case CUSTOM(path: String)

    public var path: String {
        switch self {
        case .MAINNET:
            return "mainnet"
        case .TESTNET:
            return "goerli"
        case .CYAN, .AQUA, .CELESTE:
            return "polygon-mainnet"
        case let .CUSTOM(path):
            return path
        }
    }
    
    public var name: String {
        switch self {
        case .MAINNET:
            return "mainnet"
        case .TESTNET:
            return "testnet"
        case .CYAN :
            return "cyan"
        case .AQUA :
            return "aqua"
        case .CELESTE:
            return "celeste"
        case .CUSTOM(_):
            return "custom"
        }
    }
    
    public var migration_map: LegacyNetworkMigrationInfo {
        switch self {
        case .MAINNET:
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET)
        case .TESTNET:
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: "teal", networkMigratedTo: SapphireNetwork.SAPPHIRE_DEVNET)
        case .CYAN :
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET)
        case .AQUA :
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET)
        case .CELESTE:
            return LegacyNetworkMigrationInfo(migrationCompleted: false, networkIdentifier: self.name, networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET)
        case .CUSTOM(_):
            return LegacyNetworkMigrationInfo(migrationCompleted: false, networkIdentifier: self.name, networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET)
        }
    }
    
    public var networkMap : String {
        switch self {
        case .MAINNET: return "mainnet"
        case .TESTNET: return "goerli"
        case .CYAN: return "polygon-mainnet"
        case .AQUA: return "polygon-mainnet"
        case .CELESTE: return "polygon-mainnet"
        case .CUSTOM(let path) : return path
        }
    }
    
    public var signerMap : String {
        switch self {
        case .MAINNET: return "https://signer.web3auth.io"
        case .TESTNET: return "https://signer.web3auth.io"
        case .CYAN: return "https://signer-polygon.web3auth.io"
        case .AQUA: return "https://signer-polygon.web3auth.io"
        case .CELESTE: return "https://signer-polygon.web3auth.io"
        case .CUSTOM(let path) : return path
        }
    }
    
    public var metadataMap: String {
        switch self {
        case .MAINNET: return "https://metadata.web3auth.io"
        case .TESTNET: return "https://metadata.web3auth.io"
        case .CYAN: return "https://metadata.web3auth.io"
        case .AQUA: return "https://metadata.web3auth.io"
        case .CELESTE: return "https://metadata.web3auth.io"
        case .CUSTOM(let path): return path
        }
    }
}

