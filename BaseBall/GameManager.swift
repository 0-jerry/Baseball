//
//  GameManager.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/7/24.
//

import Foundation

//MARK: - 게임 전체 관리자
struct GameManager {
    
    //시작시 출력되는 메서드
    private let welcomeMessage = "환영합니다! 원하시는 번호를 입력해주세요."
    
    //게임 프로그램 시작 메서드
    func start() {
        print(welcomeMessage)
        let gameCommandConverter = GameCommandConverter()
        
        while true {
            //GameCommand를 초기화
            let gameCommand = gameCommandConverter.input()
            let gameCommandMessage = gameCommandMessage(gameCommand)
            print("\n", gameCommandMessage)
            
            switch gameCommand {
            //숫자 야구 게임 시작
            case .start:
                var gameRound = GameRound()
                gameRound.play()
                
            //게임 기록 확인
            case .history:
                let gamehistory = GameHistory.shared
                print(gamehistory, "\n")
                
            //프로그램 종료
            case .exit:
                return
            }
        }
    }
    
    //선택 명령을 문자열로 연산
    private func gameCommandMessage(_ gamecommand: GameCommand) -> String {
        return "< \(gamecommand.rawValue) >"
    }
}
