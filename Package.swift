// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "FlowUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FlowUI",
            targets: ["FlowUI"]
        )
    ],
    targets: [
        .target(
            name: "FlowUI",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
