//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

//
struct BaseballGame {
    
    private let life: Int = GameStatus.lifeFullCount
    private var countOfTry: Int = 0
    private let targetNumbers: TargetNumbers
    
    private var lifeCount: Int {
        life - countOfTry
    }
    
    init() {
        self.targetNumbers = TargetNumbers()
    }
    
    mutating func play() {
        defer { print() }
        
        let shootRequestHandler = ShootRequestHandler()
        let gameHistory = GameHistory.shared
        
        var gameResult = GameResult()
        
        while true {
            countTry()
            print(self.targetNumbers)
            let request = shootRequestHandler.input()
        
            let judgeResult = judge(shoot: request)
            gameResult.addJudgeResult(judgeResult)
            print(judgeResult, "\n")
            
            if judgeResult.isWin() {
                print("Win!")
                return }
            
            do {
                try check()
            } catch {
                print(error)
                
                return
            }
        }
        
        gameHistory.addGameResult(gameResult)
    }
    
    private func judge(shoot: ShootRequest) -> JudgeResult {
        let judgeResult = JudgeResult(shoot: shoot, target: self.targetNumbers)
        
        return judgeResult
    }
    
    private func check() throws {
        guard checkLifeCount() else {
            throw BaseballGameError.notEnoughtLifeCount
        }
    }
    
    private func checkLifeCount() -> Bool {
        self.lifeCount > 0
    }
    
    private mutating func countTry() {
        self.countOfTry += 1
    }
}
