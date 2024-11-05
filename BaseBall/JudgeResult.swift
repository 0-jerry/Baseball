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
    
    var description: String {
        if strike == 0 && ball == 0 {
            return "OUT"
        } else if strike == 0 {
            return "\(ball)B"
        } else if ball == 0 {
            return "\(strike)S"
        } else {
            return "\(strike)S \(ball)B"
        }
    }
    
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
}
