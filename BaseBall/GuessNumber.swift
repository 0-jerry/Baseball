//
//  BaseballNumbers.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

//MARK: - 유저 추측 숫자
struct GuessNumber {
    
    let numbers: [Int]
    
    //예외처리 숫자의 갯수 확인 - 생성자에서 사용하기 위한 정적 메서드 형태
    private static func checkCountOfNumbers(_ numbers: [Int]) -> Bool {
        numbers.count == GameStatus.countOfNumbers
    }
    
    //첫 숫자가 0인지 확인 - 생성자에서 사용하기 위한 정적 메서드 형태
    private static func checkFirstNumberIsZero(_ numbers: [Int]) -> Bool {
        numbers[0] == 0
    }
    
    init(_ numbers: [Int]) throws {
        guard Self.checkCountOfNumbers(numbers) else {
            throw GuessNumberError.baseballNumbersLengthIncorrect
        }
        guard !Self.checkFirstNumberIsZero(numbers) else {
            throw GuessNumberError.baseballNumbersFirstIsZero
        }
        
        self.numbers = numbers
    }
}
