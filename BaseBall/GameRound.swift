//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

//MARK: - 게임 라운드 구조체
struct GameRound {
    
    //시도횟수
    private var countOfTry: Int = 0
    
    //생성자를 통해서 랜덤 타켓넘버 생성 및 초기화
    private let targetNumber: TargetNumber
    
    //잔여 기회
    private var lifeCount: Int { GameStatus.lifeFullCount - countOfTry }
    
    //랜덤 타겟넘버를 생성하여 초기화
    init() {
        self.targetNumber = TargetNumber()
    }
    
    //게임 실행 메서드
    mutating func play() {
        //라운드 종료시 실행되는 줄 바꿈 출력
        defer { print() }
        
        let gameHistory = GameHistory.shared
        
        var gameResult = GameResult()
        //라운드 종료시 게임 기록 저장
        defer { gameHistory.addGameResult(gameResult) }
        
        while true {
            //잔여횟수가 남아 있을 경우
            guard enoughLifeCount() else {
                print("lose...")
                return
            }
            
            countTry()
            //유저 숫자
            let guessNumber = BaseballNumberConverter().input()
        
            //판단 결과 연산
            let judgeResult = judge(guessNumber: guessNumber)
            //라운드 결과에 추가
            gameResult.addJudgeResult(judgeResult)
            //판단 결과 출력
            print(judgeResult, "\n")
            
            //성공했을 경우
            if judgeResult.isWin() {
                gameResult.win()
                print("WIN!")
                return
            }
        }
    }
    
    //타겟 숫자와 입력 숫자를 비교하며 JudgeResult 생성
    private func judge(guessNumber: GuessNumber) -> JudgeResult {
        let judgeResult = JudgeResult(guess: guessNumber,
                                      target: self.targetNumber)

        return judgeResult
    }
    
    //시도에 대한 데이터 반영
    private mutating func countTry() {
        self.countOfTry += 1
    }
    
    //잔여횟수 확인
    private func enoughLifeCount() -> Bool {
        self.lifeCount > 0
    }
}
