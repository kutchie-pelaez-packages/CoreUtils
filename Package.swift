// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "CoreUtils",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "CoreUtils", targets: ["CoreUtils"])
    ],
    dependencies: [
        .package(url: "https://github.com/kutchie-pelaez-packages/SwiftExtensions.git", branch: "master")
    ],
    targets: [
        .target(name: "CoreUtils", dependencies: [
            .product(name: "SwiftExtensions", package: "SwiftExtensions")
        ], path: "Sources")
    ]
)
