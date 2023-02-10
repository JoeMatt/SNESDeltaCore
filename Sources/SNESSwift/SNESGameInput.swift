//
//  SNESGameInput.swift
//  SNESSwift
//
//  Created by Riley Testut on 7/22/15.
//  Copyright © 2015 Riley Testut. All rights reserved.
//

import DeltaCore

public extension CheatType {
    static let CheatTypeActionReplay = "ActionReplay"
    static let CheatTypeGameGenie = "GameGenie"

    static let actionReplay: CheatType = .init(rawValue: CheatTypeActionReplay)
    static let gameGenie: CheatType = .init(rawValue: CheatTypeGameGenie)
}

@objc public enum SNESGameInput: Int, _Input {
    case up     = 1
    case down   = 2
    case left   = 4
    case right  = 8
    case a      = 16
    case b      = 32
    case x      = 64
    case y      = 128
    case l      = 256
    case r      = 512
    case start  = 1024
    case select = 2048
}
