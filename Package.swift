// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import PackageDescription

var swiftSettings: [SwiftSetting] = [
    .define("SQLITE_HAS_CODEC"),
    .define("GRDBCIPHER"),
    .define("SQLITE_ENABLE_FTS5")
]

var cSettings: [CSetting] = [
    .define("SQLITE_HAS_CODEC", to: "1"),
    .define("GRDBCIPHER", to: "1"),
    .define("SQLITE_ENABLE_FTS5", to: "1")
]

let package = Package(
    name: "GRDB",
    products: [
        .library(
            name: "GRDB",
            targets: ["GRDB"]),
    ],
    dependencies: [
        .package(url: "https://github.com/crazzy263/SQLCipher", from: "1.0.1")
    ],
    targets: [
        .target(
            name: "GRDB",
            dependencies: ["SQLCipher"],
            cSettings: cSettings,
            swiftSettings: swiftSettings)
    ]
)
