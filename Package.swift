// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "JokeAppDependencies",
    dependencies: [
        .package(
            url: "https://github.com/Aw79/JokeAPI.git",
            branch: "main"
        )
    ]
)
