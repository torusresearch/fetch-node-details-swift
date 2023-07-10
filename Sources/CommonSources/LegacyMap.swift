//
//  File.swift
//  
//
//  Created by CW Lee on 10/07/2023.
//

import Foundation


public struct LegacyNetworkMigrationInfo {
    public var migrationCompleted: Bool
    public var networkIdentifier: String
    public var networkMigratedTo: SapphireNetwork
}

public var LEGACY_NETWORKS_ROUTE_MAP : [ LegacyNetwork : LegacyNetworkMigrationInfo ] = [
    LegacyNetwork.AQUA : LegacyNetworkMigrationInfo(migrationCompleted: false, networkIdentifier: "aqua", networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET),
    LegacyNetwork.CELESTE : LegacyNetworkMigrationInfo(migrationCompleted: false, networkIdentifier: "celeste", networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET),
    LegacyNetwork.CYAN : LegacyNetworkMigrationInfo(migrationCompleted: false, networkIdentifier: "cyan", networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET),
    LegacyNetwork.MAINNET : LegacyNetworkMigrationInfo(migrationCompleted: false, networkIdentifier: "mainnet", networkMigratedTo: SapphireNetwork.SAPPHIRE_MAINNET),
    LegacyNetwork.TESTNET : LegacyNetworkMigrationInfo(migrationCompleted: false, networkIdentifier: "teal", networkMigratedTo: SapphireNetwork.SAPPHIRE_TESTNET)
]



