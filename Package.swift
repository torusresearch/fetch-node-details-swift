// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FetchNodeDetails",
    platforms: [.iOS(.v13),.macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "FetchNodeDetails",
            targets: ["FetchNodeDetails"]),
        .library(
            name: "fnd_base",
            targets: ["fnd_base"]),
    ],
    dependencies: [
        .package(url: "https://github.com/argentlabs/web3.swift", from:"0.8.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FetchNodeDetails",
            dependencies: ["web3.swift"],
            path: "Sources"),
        .testTarget(
            name: "FetchNodeDetailsTests",
            dependencies: ["FetchNodeDetails"]),
        .target(
            name: "fnd_base",
            dependencies: [],
            path: "Sources/fnd_base",
            sources: [
                "Configs",
                "Endpoints",
                "Utils",
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
