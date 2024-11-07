//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//
import Foundation

//MARK: - 시도 결과 구조체
struct JudgeResult: CustomStringConvertible {
    
    private let strike: Int
    private let ball: Int
    
    var description: String {
        if strike == 0 && ball == 0 {
            return "[OUT]"
        } else if strike == 0 {
            return "[\(ball) 볼]"
        } else if ball == 0 {
            return "[\(strike) 스트라이크]"
        } else {
            return "[\(strike) 스트라이크  \(ball) 볼]"
        }
    }
    
    //추측 숫자와 목표 숫자를 비교연산하여 판단결과 초기화
    init(guess: GuessNumber, target: TargetNumber) {
        let shootNumbers = guess.numbers
        let targetNumbers = target.numbers
        var strike: Int = 0
        var ball: Int = 0
        
        for i in 0..<shootNumbers.count {
            if shootNumbers[i] == targetNumbers[i] {
                strike += 1
            } else if targetNumbers.contains(shootNumbers[i]) {
                ball += 1
            }
        }
        
        self.strike = strike
        self.ball = ball
    }
    
    //결과가 승(All Strike)인지 확인
    func isWin() -> Bool {
        strike == GameStatus.countOfNumbers
    }
}
