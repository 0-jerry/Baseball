//
//  GameStartRequestHandler.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

struct OptionRequestHandler: RequestHandler {

    typealias Request = GameOptionRequest
    
    func welcomeMessage() -> String {
        "환영합니다! 원하시는 번호를 입력해주세요."
    }
    
    func guideMessage() -> String {
        let allCases = Request.allCases
        var optionMessages: [String] = []
        
        for i in 0..<allCases.count {
            let optionMessage = "\(i+1). \(allCases[i].rawValue)"
            optionMessages.append(optionMessage)
        }
        return optionMessages.joined(separator: " ")
    }
    
    func checkErrors(_ input: String) throws {
        guard self.checkVaildInput(input) else {
            throw OptionRequsetError.invalidInput
        }
    }
    
    func formatting(_ input: String) throws -> GameOptionRequest {
        return try GameOptionRequest(input)
    }
}


extension OptionRequestHandler {
    
    private func checkVaildInput(_ input: String) -> Bool {
        ["1", "2", "3"].contains(input)
    }
}

enum GameOptionRequest: String, CaseIterable {
    
    case start = "게임 시작하기"
    case history = "게임 기록 보기"
    case exit = "종료하기"
    
    init(_ input: String) throws {
        switch input {
        case "1": self = .start
        case "2": self = .history
        case "3": self = .exit
        default: throw OptionRequsetError.invalidInput
        }
    }
}

