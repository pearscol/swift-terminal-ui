// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "TerminalUI",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "TerminalUI",
            targets: ["TerminalUI"]),
    ],
    targets: [
        .target(
            name: "TerminalUI",
            dependencies: []),
    ]
)
