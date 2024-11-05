//
//  GameOptionRequsetError.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//
import Foundation

enum OptionRequsetError: Error, CustomStringConvertible {
    
    case invalidInput
    case optionRequestInitFailed
    
    var description: String {
        switch self {
        case .invalidInput: return "지원하지 않는 요청입니다."
        case .optionRequestInitFailed: return "게임 옵션 요청 초기화 실패"
        }
    }
}
