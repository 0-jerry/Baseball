//
//  GameHistory.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/7/24.
//

import Foundation

//MARK: - 게임 기록 데이터 (싱글톤)
class GameHistory: CustomStringConvertible {
    
    private init() {}

    static let shared = GameHistory()
    
    //게임 기록 배열 형태로 저장
    private var gameResults: [GameResult] = []
    
    //게임 기록 출력을 위한 연산
    var description: String {
        guard !gameResults.isEmpty else {
            return "기록이 존재하지 않습니다."
        }
        
        var historyMessages: [String] = []
        
        for i in 0..<gameResults.count {
            let gameResultMessage = String(describing: gameResults[i])
            let historyMessage = "\(i+1)번째 게임" + " : " + gameResultMessage
            historyMessages.append(historyMessage)
        }
        
        return historyMessages.joined(separator: "\n")
    }
    
    //게임 라운드가 종료될 경우 사용될 메서드
    func addGameResult(_ gameResult: GameResult) {
        gameResults.append(gameResult)
    }
}
