// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SIMDUtils",
    platforms: [
        // TODO: selectively enable features based on platform
        .macOS(.v26)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            // TODO: think of a better name maybe
            name: "SIMDUtils",
            targets: ["SIMDUtils"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SIMDUtils"
        ),
        .executableTarget(
            name: "SIMDUtilsDemo",
            dependencies: ["SIMDUtils"]
        ),
        .testTarget(
            name: "SIMDUtilsTests",
            dependencies: ["SIMDUtils"]
        ),
    ]
)
