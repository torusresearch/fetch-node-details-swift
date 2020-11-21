// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FetchNodeDetails",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "FetchNodeDetails",
            targets: ["FetchNodeDetails"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rathishubham7/swift-logger", from:"0.0.1"),
        .package(url: "https://github.com/matter-labs/web3swift", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FetchNodeDetails", dependencies: ["web3swift", "BestLogger"], path: "Sources"),
        .testTarget(
            name: "FetchNodeDetailsTests",
            dependencies: ["FetchNodeDetails"]),
    ]
)
