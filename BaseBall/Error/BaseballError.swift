//
//  BaseballError.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

enum BaseballError: Error, CustomStringConvertible {
        
    case invalidNumber
    case baseballNumbersLengthIncorrect(count: Int)
    case baseballNumbersFirstIsZero
    case unknown
    
    var description: String {
        switch self {
        case .invalidNumber: return "부적합한 숫자"
        case .baseballNumbersLengthIncorrect(let count): return "\(count)개의 숫자를 입력해야 합니다."
        case .baseballNumbersFirstIsZero: return "첫번째 숫자는 0이 될 수 없습니다."
        default: return "알 수 없는 에러"
        }
    }

}


