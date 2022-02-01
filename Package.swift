// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "experiments-cla2020",
    platforms: [
        .macOS(.v10_12),
    ],
    dependencies: [
        .package(url: "https://github.com/rvyjidacek/FcaKit.git",  from: "1.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "experiments-cla2020",
            dependencies: ["FcaKit"]),
        .testTarget(
            name: "experiments-cla2020Tests",
            dependencies: ["experiments-cla2020", "FcaKit"]),
    ]
)
