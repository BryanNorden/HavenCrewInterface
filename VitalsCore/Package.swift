// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VitalsCorePackage",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "VitalsCorePackage",
            targets: ["VitalsCoreWrapper"]),
    ],
    targets: [
        .target(
            name: "VitalsCore",
            path: "Sources/VitalsCore",
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("include")
            ]
        ),
        .target(
            name: "VitalsCoreWrapper",
            dependencies: ["VitalsCore"],
            path: "Sources/VitalsCoreWrapper"
        )
    ],
    cxxLanguageStandard: .cxx17
)
