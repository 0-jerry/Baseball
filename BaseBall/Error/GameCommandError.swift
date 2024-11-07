//
//  GameOptionRequsetError.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

enum GameCommandError: Error, CustomStringConvertible {
    
    case gameCommandInitFailed
    
    var description: String {
        switch self {
        case .gameCommandInitFailed: return "게임 옵션 요청 초기화 실패"
        }
    }
}

