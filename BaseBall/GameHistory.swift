//
//  GameHistory.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/7/24.
//

import Foundation

//MARK: - 게임 기록 데이터
class GameHistory: CustomStringConvertible {
    
    static let shared = GameHistory()
    
    private init() {
    }
    
    private var gameResults: [GameResult] = []
    
    var description: String {
        print(self.gameResults.count)
        var historyMessages: [String] = []
        
        for i in 0..<gameResults.count {
            let gameResultMessage = String(describing: gameResults[i])
            let historyMessage = "\(i+1)번째 게임" + " : " + gameResultMessage
            historyMessages.append(historyMessage)
        }
        
        return historyMessages.joined(separator: "\n")
    }
    
    
    func addGameResult(_ gameResult: GameResult) {
        gameResults.append(gameResult)
    }
    
}
