//
//  GameResult.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/7/24.
//

import Foundation

//MARK: - 게임 결과 데이터
struct GameResult: CustomStringConvertible {
    
    private var countOfTry: Int {
        judgeResults.count
    }
    private var judgeResults: [JudgeResult] = []
    
    var description: String {
        "시도 횟수 - \(countOfTry)"
    }
    
    mutating func addJudgeResult(_ judgeResult: JudgeResult) {
        self.judgeResults.append(judgeResult)
    }
}
