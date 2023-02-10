//
//  SNES.swift
//  SNESDeltaCore
//
//  Created by Riley Testut on 7/22/15.
//  Copyright © 2015 Riley Testut. All rights reserved.
//

import Foundation
import AVFoundation

import DeltaCore
@_exported import SNESSwift
@_exported import SNESBridge

extension SNESGameInput: Input {
    public var type: InputType {
        return .game(.snes)
    }
}

public struct SNES: DeltaCoreProtocol {
    public static let core = SNES()
    
    public var name: String { "SNESDeltaCore" }
    public var identifier: String { "com.rileytestut.SNESDeltaCore" }
    
    public var gameType: GameType { GameType.snes }
    public var gameInputType: Input.Type { SNESGameInput.self }
    public var gameSaveFileExtension: String { "srm" }
        
    public let audioFormat = AVAudioFormat(commonFormat: .pcmFormatInt16, sampleRate: 32040, channels: 2, interleaved: true)!
    public let videoFormat = VideoFormat(format: .bitmap(.rgb565), dimensions: CGSize(width: 256, height: 224))
    
    public var supportedCheatFormats: Set<CheatFormat> {
        let gameGenieFormat = CheatFormat(name: NSLocalizedString("Game Genie", comment: ""), format: "XXXX-YYYY", type: .gameGenie)
        let proActionReplayFormat = CheatFormat(name: NSLocalizedString("Pro Action Replay", comment: ""), format: "XXXXXXXX", type: .actionReplay)
        return [gameGenieFormat, proActionReplayFormat]
    }
    
    public var emulatorBridge: EmulatorBridging { SNESEmulatorBridge.shared as! EmulatorBridging }

    public var resourceBundle: Bundle { Bundle.module }

    private init()
    {
    }
}
