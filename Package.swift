// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FetchNodeDetails",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "FetchNodeDetails",
            targets: ["FetchNodeDetails"]),
        .library(
            name: "FndBase",
            targets: ["FndBase"])
    ],
    dependencies: [
        .package(url: "https://github.com/argentlabs/web3.swift", from:"0.8.1")
    ],
    targets: [
        .target(
            name: "CommonSources",
            dependencies: [],
            path: "Sources/CommonSources"),
        .target(
            name: "FndBase",
            dependencies: ["CommonSources"],
            path: "Sources/fnd_base"),
        .target(
            name: "FetchNodeDetails",
            dependencies: ["web3.swift", "CommonSources", "FndBase"],
            path: "Sources/fetch_node_details"),
        .testTarget(
            name: "FetchNodeDetailsTests",
            dependencies: ["FetchNodeDetails","CommonSources", "FndBase"]),
    ],
    swiftLanguageVersions: [.v5]
)
