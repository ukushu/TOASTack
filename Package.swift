// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TOASTack",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TOASTack",
            targets: ["TOASTack"]),
    ],
    dependencies: [
//        .package(url: "https://gitlab.com/sergiy.vynnychenko/essentials.git", branch: "master"),
//        .package(url: "https://gitlab.com/UKS/moreswiftui.git", branch: "main"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TOASTack",
            dependencies: [
//                .product(name: "Essentials", package: "essentials"),
//                .product(name: "MoreSwiftUI", package: "moreswiftui")
            ]
        )
    ]
)
