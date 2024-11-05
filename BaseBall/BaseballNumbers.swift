//
//  BaseballNumbers.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

struct BaseballNumbers {
    
    private let numbers: [Int]
    private static var countOfNumbers: Int = 3
    
    private static func checkCountOfNumbers(_ numbers: [Int]) -> Bool {
        numbers.count == Self.countOfNumbers
    }
    
    private static func checkFirstNumberIsNotZero(_ numbers: [Int]) -> Bool {
        numbers[0] != 0
    }
    
    
    init(_ numbers: [Int]) throws {
        guard Self.checkCountOfNumbers(numbers) else {
            throw BaseballError.baseballNumbersLengthIncorrect(count: Self.countOfNumbers)
        }
        guard Self.checkFirstNumberIsNotZero(numbers) else {
            throw BaseballError.baseballNumbersFirstIsZero
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


