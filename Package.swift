// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "VaporVersioningHelper",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "VaporVersioningHelper",
      targets: ["VaporVersioningHelper"]),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.102.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "VaporVersioningHelper",
      dependencies: [
        .product(name: "Vapor", package: "vapor")
      ]
    ),
    /*.testTarget(
      name: "VaporVersioningHelperTests",
      dependencies: [
        "VaporVersioningHelper",
        .product(name: "XCTVapor", package: "vapor")
      ]
    ),*/
  ]
)
