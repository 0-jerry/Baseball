//
//  BaseballGameError.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/7/24.
//

import Foundation

enum BaseballGameError: Error, CustomStringConvertible {
    case notEnoughtLifeCount
    
    var description: String {
        switch self {
        case .notEnoughtLifeCount: return "시도횟수를 모두 소진했습니다.."
        }
    }
}

