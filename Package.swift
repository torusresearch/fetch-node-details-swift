// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FetchNodeDetails",
    platforms: [.iOS(.v13), .macOS(.v10_13)],
    products: [
        .library(
            name: "FetchNodeDetails",
            targets: ["FetchNodeDetails"]),
        .library(
            name: "FndBase",
            targets: ["FndBase"])
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0"),
    ],
    targets: [
        .target(
            name: "CommonSources",
            dependencies: ["BigInt"],
            path: "Sources/CommonSources"),
        .target(
            name: "FndBase",
            dependencies: ["CommonSources"],
            path: "Sources/FndBase"),
        .target(
            name: "FetchNodeDetails",
            dependencies: ["CommonSources", "FndBase"],
            path: "Sources/FetchNodeDetails"),
        .testTarget(
            name: "FetchNodeDetailsTests",
            dependencies: ["FetchNodeDetails","CommonSources", "FndBase"]),
    ],
    swiftLanguageVersions: [.v5]
)
