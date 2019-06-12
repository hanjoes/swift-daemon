// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftDaemon",
    products: [
        .library(
            name: "SwiftDaemonLib",
            targets: ["SwiftDaemonLib"]),
        .executable(
            name: "SwiftDaemonTest",
            targets: ["SwiftDaemonTest"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftDaemonLib",
            dependencies: []),
        .target(
            name: "SwiftDaemonTest",
            dependencies: ["SwiftDaemonLib"]),
    ]
)
