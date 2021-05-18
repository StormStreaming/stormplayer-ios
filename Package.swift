// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StormPlayer",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
        ],
    products: [
        .library(
            name: "StormPlayer",
            targets: ["StormPlayer"]),
    ],
    dependencies: [
        .package(url: "file:///Volumes/PROJEKTY/XCODE/StormLibrary", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "StormPlayer",
            dependencies: ["StormLibrary"]
        ),
        .testTarget(
            name: "StormPlayerTests",
            dependencies: ["StormPlayer"]),
    ]
)
