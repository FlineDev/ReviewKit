// swift-tools-version: 5.8
import PackageDescription

let package = Package(
   name: "ReviewKit",
   platforms: [.macOS(.v10_14), .iOS(.v12), .tvOS(.v12), .watchOS(.v5)],
   products: [.library(name: "ReviewKit", targets: ["ReviewKit"])],
   dependencies: [],
   targets: [.target(name: "ReviewKit", dependencies: [])]
)
