//
//  GameResult.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/7/24.
//

import Foundation

//MARK: - 게임 결과 데이터
struct GameResult: CustomStringConvertible {
    
    //승패
    private var isWin: Bool = false
    
    //총 시도횟수 연산
    private var countOfTry: Int { judgeResults.count }
    
    //판단 결과 저장
    private var judgeResults: [JudgeResult] = []
    
    var description: String {
        self.isWin ? "[성공] - \(countOfTry)회 시도" : "[실패]"
    }
    
    //판단 결과 추가 메서드
    mutating func addJudgeResult(_ judgeResult: JudgeResult) {
        self.judgeResults.append(judgeResult)
    }
    
    //성공할 경우 사용될 메서드
    mutating func win() {
        self.isWin = true
    }
}
