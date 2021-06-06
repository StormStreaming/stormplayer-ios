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
       // .package(name: "StormLibrary", url: "file:///Volumes/PROJEKTY/XCODE/StormLibrary", from: "1.0.0"),
        .package(name: "StormLibrary", url: "https://github.com/StormStreaming/stormlibrary-ios", from: "1.0.0"),
        
    ],
    targets: [
        .target(
            name: "StormPlayer",
            dependencies: ["StormLibrary"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "StormPlayerTests",
            dependencies: ["StormPlayer"]),
    ]
)
