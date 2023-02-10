// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SNESDeltaCore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
        .macOS(.v11),
        .tvOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SNESDeltaCore",
            targets: ["SNESDeltaCore"]),
        .library(
            name: "SNESDeltaCoreStatic",
            type: .static,
            targets: ["SNESDeltaCore"]),
        .library(
            name: "SNESDeltaCoreDynamic",
            type: .dynamic,
            targets: ["SNESDeltaCore"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/rileytestut/DeltaCore.git", .branch("main"))
        .package(path: "../DeltaCore")
    ],
    targets: [
        .target(
            name: "SNESDeltaCore",
            dependencies: ["DeltaCore", "snes9x", "SNESBridge", "SNESSwift"],
            exclude: [
                "Resources/Controller Skin/info.json",
                "Resources/Controller Skin/ipad_landscape.pdf",
                "Resources/Controller Skin/ipad_portrait_large.png",
                "Resources/Controller Skin/ipad_portrait_medium.png",
                "Resources/Controller Skin/ipad_portrait_small.png",
                "Resources/Controller Skin/ipad_splitview_landscape.pdf",
                "Resources/Controller Skin/iphone_edgetoedge_landscape.pdf",
                "Resources/Controller Skin/iphone_edgetoedge_portrait.pdf",
                "Resources/Controller Skin/iphone_landscape.pdf",
                "Resources/Controller Skin/iphone_portrait.pdf"
            ],
            resources: [
                .copy("Resources/Controller Skin/Standard.deltaskin"),
                .copy("Resources/Standard.deltamapping"),
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation")
            ]
        ),
        .target(
            name: "SNESBridge",
            dependencies: ["DeltaCore", "SNESSwift", "snes9x", .product(name: "DeltaTypes", package: "DeltaCore")],
            publicHeadersPath: "",
            cSettings: [
                .headerSearchPath("../snes9x/include"),
                .define("HAVE_STDINT_H"),
                .define("ARM"),
                .define("STATIC_LIBRARY", to: "1"),
                .define("IOS", to: "1"),
                .unsafeFlags([
                    "-fmodules",
                    "-fcxx-modules"
                ])
            ],
            cxxSettings: [
                .headerSearchPath("../snes9x/include"),
                .define("HAVE_STDINT_H"),
                .define("ARM"),
                .define("STATIC_LIBRARY", to: "1"),
                .define("IOS", to: "1"),
                .unsafeFlags([
                    "-fmodules",
                    "-fcxx-modules"
                ])
            ]
        ),
        .target(
            name: "SNESSwift",
            dependencies: ["DeltaCore"]
        ),
        .target(
            name: "snes9x",
            exclude: [
                "snes9x/docs",
                "snes9x/filter",
                "snes9x/gtk",
                "snes9x/jma",
                "snes9x/libretro",
                "snes9x/macosx",
                "snes9x/unix",
                "snes9x/win32"
            ],
            sources: [
                "snes9x/apu/apu.cpp",
                "snes9x/apu/bapu/dsp/sdsp.cpp",
                "snes9x/apu/bapu/dsp/SPC_DSP.cpp",
                "snes9x/apu/bapu/smp/smp.cpp",
                "snes9x/apu/bapu/smp/smp_state.cpp",
                "snes9x/bsx.cpp",
                "snes9x/c4.cpp",
                "snes9x/c4emu.cpp",
                "snes9x/cheats.cpp",
                "snes9x/cheats2.cpp",
                "snes9x/clip.cpp",
                "snes9x/conffile.cpp",
                "snes9x/controls.cpp",
                "snes9x/cpu.cpp",
                "snes9x/cpuexec.cpp",
                "snes9x/cpuops.cpp",
                "snes9x/crosshairs.cpp",
                "snes9x/dma.cpp",
                "snes9x/dsp.cpp",
                "snes9x/dsp1.cpp",
                "snes9x/dsp2.cpp",
                "snes9x/dsp3.cpp",
                "snes9x/dsp4.cpp",
                "snes9x/fxinst.cpp",
                "snes9x/fxemu.cpp",
                "snes9x/gfx.cpp",
                "snes9x/globals.cpp",
                "snes9x/logger.cpp",
                "snes9x/memmap.cpp",
                "snes9x/movie.cpp",
                "snes9x/msu1.cpp",
                "snes9x/obc1.cpp",
                "snes9x/ppu.cpp",
                "snes9x/stream.cpp",
                "snes9x/sa1.cpp",
                "snes9x/sa1cpu.cpp",
//                "snes9x/screenshot.cpp",
                "snes9x/sdd1.cpp",
                "snes9x/sdd1emu.cpp",
                "snes9x/seta.cpp",
                "snes9x/seta010.cpp",
                "snes9x/seta011.cpp",
                "snes9x/seta018.cpp",
                "snes9x/snapshot.cpp",
                "snes9x/snes9x.cpp",
                "snes9x/spc7110.cpp",
                "snes9x/srtc.cpp",
                "snes9x/tile.cpp",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("snes9x/apu/bapu"),
                .headerSearchPath("snes9x/"),
                .unsafeFlags([
                    "-funsigned-char",
                    "-ffast-math",
                    "-finline",
                    "-fno-builtin",
                    "-fno-common",
                    "-fomit-frame-pointer",
                    "-funroll-loops",
                    "-fstrict-aliasing",
                ]),
                .define("HAVE_STDINT_H"),
                .define("ARM"),
                .define("STATIC_LIBRARY", to: "1"),
                .define("IOS", to: "1")
            ],
            cxxSettings: [
                .headerSearchPath("snes9x/apu/bapu"),
                .headerSearchPath("snes9x/"),
                .unsafeFlags([
                    "-funsigned-char",
                    "-ffast-math",
                    "-finline",
                    "-fno-builtin",
                    "-fno-common",
                    "-fomit-frame-pointer",
                    "-funroll-loops",
                    "-fstrict-aliasing",
                ]),
                .define("HAVE_STDINT_H"),
                .define("ARM"),
                .define("STATIC_LIBRARY", to: "1"),
                .define("IOS", to: "1")
            ]
        )
    ]
)
