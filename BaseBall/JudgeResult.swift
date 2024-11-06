//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//
import Foundation

//MARK: - 시도결과 반환용 구조체
struct JudgeResult: CustomStringConvertible {
    
    private let strike: Int
    private let ball: Int
    private let countOfBalls: Int = GameStatus.countOfBalls
    
    var description: String {
        if strike == 0 && ball == 0 {
            return "OUT"
        } else if strike == 0 {
            return "\(ball) 볼"
        } else if ball == 0 {
            return "\(strike) 스트라이크"
        } else {
            return "\(strike)스트라이크 | \(ball)볼"
        }
    }
    
    //이후 예외처리 추가 가능 (숫자의 갯수 체크)
    init(shoot: ShootRequest, target: TargetNumbers) {
        let shootNumbers = shoot.numbers
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
    
    func isWin() -> Bool {
        strike == countOfBalls
    }
}
