//
//  BaseBallGameManager.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/4/24.
//

import Foundation

enum UserInputConvertibleError: Error, CustomStringConvertible {
    
    case readLineFailed
    
    var description: String {
        switch self {
        case .readLineFailed: return "입력을 읽지 못했습니다"
        }
    }
}
