//
//  OptionRequest.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

//MARK: - 게임 명령 열거형
enum GameCommand: String, CaseIterable {
    
    case start = "게임 시작하기"
    case history = "게임 기록 보기"
    case exit = "종료하기"
    
    init(_ input: Int) throws {
        switch input {
        case 1: self = .start
        case 2: self = .history
        case 3: self = .exit
        default: throw GameCommandError.gameCommandInitFailed
        }
    }
}
