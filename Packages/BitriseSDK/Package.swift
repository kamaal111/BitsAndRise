// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BitriseSDK",
    products: [
        .library(
            name: "BitriseSDK",
            targets: ["BitriseSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kamaal111/XiphiasNet", from: "3.0.5"),
        .package(url: "https://github.com/kamaal111/ShrimpExtensions", from: "1.9.0")
    ],
    targets: [
        .target(
            name: "BitriseSDK",
            dependencies: ["XiphiasNet", "ShrimpExtensions"]),
        .testTarget(
            name: "BitriseSDKTests",
            dependencies: ["BitriseSDK"]),
    ]
)
