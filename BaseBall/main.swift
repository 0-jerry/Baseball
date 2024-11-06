
import Foundation

//아쉬운점
//1. 예외처리가 중복된 형태로 이뤄지게 되었다. (입력 검증 -> 형식 검증 -> 검증된 데이터임에도 생성자에서 추가 검증) -> 에러처리를 통한 데이터 검증을 거치지만, 생성자는 또 그 자체로 검증 시스템을 갖춰야 하지 않을까 하는 고민 예외처리가 생성자 내부에서 이뤄져야 할까?
//2. 작명이 전혀 직관적이지 못하다. - 도움이 되는 팁이 있을까요?
//3. 데이터 흐름이 개선할 부분이 많다고 느껴짐
//4. 객체들의 고유해야하는 목적성 상실 ( BaseballGame의 라이프 카운트, GameResult의 라이프 카운트)

func main() {
    let optionRequestHandler = OptionRequestHandler()
//    let gameHistory = GameHistory()
    
    while true {
        let optionRequest = optionRequestHandler.input()
        let optionRequestMessage = optionGuideMessage(optionRequest)
        
        print(optionRequestMessage)
        switch optionRequest {
        case .start:
            var baseballGame = BaseballGame()
            baseballGame.play()
        case .history:
            let gamehistory = GameHistory.shared
            print(gamehistory)
        case .exit:
            return
        }
        
    }
}


func optionGuideMessage(_ optionRequest: OptionRequest) -> String {
    return "< \(optionRequest.rawValue) >"
}

main()
