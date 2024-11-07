//
//  GameCommandConverterError.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/8/24.
//

import Foundation

enum GameCommendConverterError: Error, CustomStringConvertible {
    
    case invalidInput
    
    var description: String {
        switch self {
        case .invalidInput: return "지원하지 않는 요청입니다."
        }
    }
}

