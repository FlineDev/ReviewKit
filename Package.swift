// swift-tools-version: 5.8
import PackageDescription

let package = Package(
   name: "ReviewKit",
   platforms: [.iOS(.v11), .macOS(.v10_14), .macCatalyst(.v14)],
   products: [.library(name: "ReviewKit", targets: ["ReviewKit"])],
   dependencies: [],
   targets: [.target(name: "ReviewKit", dependencies: [])]
)
