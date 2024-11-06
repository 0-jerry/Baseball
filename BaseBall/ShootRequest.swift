//
//  BaseballNumbers.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

//MARK: - 플레이어의 선택 숫자
struct ShootRequest {
    
    let numbers: [Int]
    
    //예외처리 숫자의 갯수 확인
    private static func checkCountOfNumbers(_ numbers: [Int]) -> Bool {
        numbers.count == GameStatus.countOfBalls
    }
    

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
