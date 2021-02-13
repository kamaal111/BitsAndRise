// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BitriseSDK",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "BitriseSDK",
            targets: ["BitriseSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kamaal111/XiphiasNet", from: "3.0.5")
    ],
    targets: [
        .target(
            name: "BitriseSDK",
            dependencies: ["XiphiasNet"]),
        .testTarget(
            name: "BitriseSDKTests",
            dependencies: ["BitriseSDK"]),
    ]
)
