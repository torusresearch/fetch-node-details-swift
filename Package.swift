// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FetchNodeDetails",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "FetchNodeDetails",
            targets: ["FetchNodeDetails"]),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0"),
    ],
    targets: [
        .target(
            name: "FetchNodeDetails",
            dependencies: ["BigInt"],
            path: "Sources"),
        .testTarget(
            name: "FetchNodeDetailsTests",
            dependencies: ["FetchNodeDetails"]),
    ],
    swiftLanguageVersions: [.v5]
)
