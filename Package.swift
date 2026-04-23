// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "cordova-sqlcipher-adapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "cordova-sqlcipher-adapter",
            targets: ["SqlcipherAdapterPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/apache/cordova-ios.git", branch: "master")
    ],
    targets: [
        .target(
            name: "SqlcipherAdapterPlugin",
            dependencies: [
                .product(name: "Cordova", package: "cordova-ios")
            ],
            path: "src",
            sources: [
                "ios/SQLitePlugin.m",
                "ios/CustomPSPDFThreadSafeMutableDictionary.m",
                "common/sqlite3.c"
            ],
            publicHeadersPath: "ios",
            cSettings: [
                .headerSearchPath("common"),
                .define("SQLITE_HAS_CODEC"),
                .define("HAVE_USLEEP", to: "1"),
                .define("SQLITE_TEMP_STORE", to: "3"),
                .define("SQLITE_EXTRA_INIT", to: "sqlcipher_extra_init"),
                .define("SQLITE_EXTRA_SHUTDOWN", to: "sqlcipher_extra_shutdown"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .define("SQLITE_LOCKING_STYLE", to: "1"),
                .define("NDEBUG"),
                .define("SQLITE_THREADSAFE", to: "1"),
                .define("SQLITE_DEFAULT_SYNCHRONOUS", to: "3"),
                .define("SQLITE_DEFAULT_MEMSTATUS", to: "0"),
                .define("SQLITE_OMIT_DECLTYPE"),
                .define("SQLITE_OMIT_DEPRECATED"),
                .define("SQLITE_OMIT_PROGRESS_CALLBACK"),
                .define("SQLITE_OMIT_SHARED_CACHE"),
                .define("SQLITE_OMIT_LOAD_EXTENSION"),
                .define("SQLITE_ENABLE_FTS3"),
                .define("SQLITE_ENABLE_FTS3_PARENTHESIS"),
                .define("SQLITE_ENABLE_FTS4"),
                .define("SQLITE_ENABLE_RTREE"),
                .define("SQLITE_ENABLE_FTS5"),
                .define("SQLITE_ENABLE_JSON1")
            ],
            linkerSettings: [
                .linkedFramework("Security")
            ])
    ]
)