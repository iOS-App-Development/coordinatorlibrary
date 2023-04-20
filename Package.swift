// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoordinatorLibrary",
    platforms: [
            .iOS(.v10),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoordinatorLibrary",
            targets: ["CoordinatorLibrary"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "RouterLibrary",url: "https://github.com/iOS-App-Development/routerlibrary.git", .branch("master"))

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoordinatorLibrary",
            dependencies: ["RouterLibrary"]),
        .testTarget(
            name: "CoordinatorLibraryTests",
            dependencies: ["CoordinatorLibrary"]),
    ],
    swiftLanguageVersions: [.v5]
)
