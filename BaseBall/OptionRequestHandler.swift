//
//  GameStartRequestHandler.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

//MARK: - 옵션 선택 요청 핸들러
struct OptionRequestHandler: RequestHandler {

    typealias Request = OptionRequest
    typealias Format = Int


    func guideMessage() -> String {
        let welcomeMessage = "환영합니다! 원하시는 번호를 입력해주세요."
        let allCases = Request.allCases
        var optionMessages: [String] = []
        
        for i in 0..<allCases.count {
            let optionMessage = "\(i+1). \(allCases[i].rawValue)"
            optionMessages.append(optionMessage)
        }
        return welcomeMessage + "\n" + optionMessages.joined(separator: " ")
    }
    
    func convertTo(_ input: String) throws -> Format {
        guard let int = Int(input) else {
            throw OptionRequsetError.optionRequestInitFailed
        }
        return int
    }
    
    func checkErrors(_ input: Format) throws {
        guard self.vaildInput(input) else {
            throw OptionRequsetError.optionRequestInitFailed
        }
    }
    
    func initRequest(_ input: Format) throws -> OptionRequest {
        return try OptionRequest(input)
    }
    
}


extension OptionRequestHandler {
    
    private func vaildInput(_ input: Format) -> Bool {
        [1,2,3].contains(input)
    }
}


