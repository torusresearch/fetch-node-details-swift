import Foundation

public enum Web3AuthNetwork: Equatable, Hashable {
    case MAINNET
    case TESTNET
    case CYAN
    case AQUA
    case CELESTE
    case SAPPHIRE_DEVNET
    case SAPPHIRE_MAINNET
    
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
        case .SAPPHIRE_DEVNET:
            return "sapphire_devnet"
        case .SAPPHIRE_MAINNET:
            return "sapphire_mainnet"
        }
    }
    
    public var path: String {
        switch self {
        case .MAINNET:
            return "mainnet"
        case .TESTNET:
            return "goerli"
        case .CYAN, .AQUA, .CELESTE:
            return "polygon-mainnet"
        case .SAPPHIRE_DEVNET:
            return "sapphire_devnet"
        case .SAPPHIRE_MAINNET:
            return "sapphire_mainnet"
        }
    }
    
    public var signerMap : String {
        switch self {
        case .MAINNET: return "https://signer.web3auth.io"
        case .TESTNET: return "https://signer.web3auth.io"
        case .CYAN: return "https://signer-polygon.web3auth.io"
        case .AQUA: return "https://signer-polygon.web3auth.io"
        case .CELESTE: return "https://signer-polygon.web3auth.io"
        case .SAPPHIRE_MAINNET: return "https://signer.web3auth.io"
        case .SAPPHIRE_DEVNET: return "https://signer.web3auth.io"
        }
    }
    
    public var metadataMap : String {
        switch self {
        case .MAINNET: return "https://metadata.web3auth.io"
        case .TESTNET: return "https://metadata.web3auth.io"
        case .CYAN: return "https://metadata.web3auth.io"
        case .AQUA: return "https://metadata.web3auth.io"
        case .CELESTE: return "https://metadata.web3auth.io"
        case .SAPPHIRE_MAINNET: return "https://metadata.web3auth.io"
        case .SAPPHIRE_DEVNET: return "https://metadata.web3auth.io"
        }
    }
    
    public var networkMap : String {
        switch self {
        case .MAINNET: return "mainnet"
        case .TESTNET: return "goerli"
        case .CYAN: return "polygon-mainnet"
        case .AQUA: return "polygon-mainnet"
        case .CELESTE: return "polygon-mainnet"
        case .SAPPHIRE_DEVNET: return "sapphire_devnet"
        case .SAPPHIRE_MAINNET: return "sapphire_mainnet"
        }
    }
    
    public var migration_map: LegacyNetworkMigrationInfo {
        switch self {
        case .MAINNET:
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: Self.SAPPHIRE_MAINNET)
        case .TESTNET:
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: "teal", networkMigratedTo: Self.SAPPHIRE_DEVNET)
        case .CYAN :
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: Self.SAPPHIRE_MAINNET)
        case .AQUA :
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: Self.SAPPHIRE_MAINNET)
        case .CELESTE:
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: Self.SAPPHIRE_MAINNET)
        default:
            return LegacyNetworkMigrationInfo(migrationCompleted: true, networkIdentifier: self.name, networkMigratedTo: Self.SAPPHIRE_MAINNET)
        }
    }
    
    public var fndServer: String {
        return "https://fnd.web3auth.io"
    }
    
    public var sessionServer: String {
        return "https://session.web3auth.io"
    }
}

