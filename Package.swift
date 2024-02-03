// swift-tools-version: 5.9
import PackageDescription

let package = Package(
   name: "ReviewKit",
   platforms: [.iOS(.v12), .macOS(.v10_14), .macCatalyst(.v14), .visionOS(.v1)],
   products: [.library(name: "ReviewKit", targets: ["ReviewKit"])],
   dependencies: [],
   targets: [.target(name: "ReviewKit", dependencies: [])]
)
