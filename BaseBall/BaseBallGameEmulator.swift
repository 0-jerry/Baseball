//
//  BaseBallGameManager.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/4/24.
//

import Foundation

enum BaseBallError: Error, CustomStringConvertible {
    
    var description: String {
        switch self {
        case .invalidNumber: return "부적합한 숫자"
        case .baseBallNumbersLengthIncorrect(let count): return "\(count)개의 숫자를 입력해야 합니다."
        case .baseBallNumbersFirstIsZero: return "첫번째 숫자는 0이 될 수 없습니다."
        default: return "알 수 없는 에러"
        }
    }
    
    case invalidNumber
    case baseBallNumbersLengthIncorrect(count: Int)
    case baseBallNumbersFirstIsZero
    case unknown
}

struct BaseBallNumbers {
    
    private let numbers: [Int]
    private static let countOfNumbers: Int = 3
    
    private static func checkCountOfNumbers(_ numbers: [Int]) -> Bool {
        numbers.count == Self.countOfNumbers
    }
    
    private static func checkFirstNumberIsNotZero(_ numbers: [Int]) -> Bool {
        numbers[0] != 0
    }
    
    init(_ numbers: [Int]) throws {
        guard Self.checkCountOfNumbers(numbers) else {
            throw BaseBallError.baseBallNumbersLengthIncorrect(count: Self.countOfNumbers)
        }
        
        guard Self.checkFirstNumberIsNotZero(numbers) else {
            throw BaseBallError.baseBallNumbersFirstIsZero
        }
        
        self.numbers = numbers
    }
}

struct BaseBallResult: CustomStringConvertible {
    
    private let strike: Int
    
    private let ball: Int
    
    var description: String {
        switch (strike, ball) {
        case (0,0): return "Nothing"
        case (_, 0): return "\(self.strike) 스트라이크"
        case (0, _): return "\(self.ball) 볼"
        default: return "\(self.strike) 스트라이크 \(self.ball) 볼"
        }
    }
}
