// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftDaemon",
    products: [
        .library(
            name: "SwiftDaemon",
            targets: ["SwiftDaemon"]),
        .executable(
            name: "SwiftDaemonTest",
            targets: ["SwiftDaemonTest"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftDaemon",
            dependencies: []),
        .target(
            name: "SwiftDaemonTest",
            dependencies: ["SwiftDaemon"]),
    ]
)
