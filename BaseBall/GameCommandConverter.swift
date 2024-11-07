//
//  GameStartRequestHandler.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

//MARK: - 명령 입력 변환자
struct GameCommandConverter {
    
    func initRequest(_ input: Format) throws -> GameCommand {
        return try GameCommand(input)
    }
    
    private func checkVaildInput(_ input: Format) -> Bool {
        [1,2,3].contains(input)
    }
}


//MARK: - UserInputConvertible 준수
extension GameCommandConverter: UserInputConvertible {
    
    typealias Format = Int

    typealias Request = GameCommand
    
    func guideMessage() -> String {
        let line = "====================================="
        let allCases = Request.allCases
        var gamecommandMessages: [String] = []
        
        for i in 0..<allCases.count {
            let optionMessage = "\(i+1). \(allCases[i].rawValue)"
            gamecommandMessages.append(optionMessage)
        }
        return line + "\n" + gamecommandMessages.joined(separator: " ")
    }
    
    func convertTo(_ input: String) throws -> Format {
        guard let int = Int(input) else {
            throw GameCommandError.gameCommandInitFailed
        }
        return int
    }
    
    func checkErrors(_ input: Format) throws {
        guard self.checkVaildInput(input) else {
            throw GameCommandError.gameCommandInitFailed
        }
    }
}
