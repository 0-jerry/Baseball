//
//  BaseballNumbers.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

struct ShootRequest {
    
    let numbers: [Int]
    
    //예외처리 숫자의 갯수 확인
    private static func checkCountOfNumbers(_ numbers: [Int]) -> Bool {
        numbers.count == GameRuler.countOfBalls
    }
    
//    숫자의
    private static func checkFirstNumberIsZero(_ numbers: [Int]) -> Bool {
        numbers[0] == 0
    }
    
    
    init(_ numbers: [Int]) throws {
        guard Self.checkCountOfNumbers(numbers) else {
            throw ShootRequestError.baseballNumbersLengthIncorrect
        }
        guard !Self.checkFirstNumberIsZero(numbers) else {
            throw ShootRequestError.baseballNumbersFirstIsZero
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


