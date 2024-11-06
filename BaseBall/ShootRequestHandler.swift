//
//  ShootRequestHandler.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//
import Foundation

//MARK: - 시도 요청 핸들러
struct ShootRequestHandler: RequestHandler {

    typealias Request = ShootRequest
    
    typealias Format = [Int]
    
    func guideMessage() -> String {
        "\(GameStatus.countOfBalls) 자리의 숫자를 입력하세요."
    }
    
    func convertTo(_ input: String) throws -> Format {
        let input: Format = try input.map {
            guard let int = Int(String($0)) else {
                throw ShootRequestHandlerError.isNotNumber
            }
            return int
        }
        
        return input
    }
    
    func checkErrors(_ input: Format) throws {
        guard !firstNumberIsZero(input) else {
            throw ShootRequestHandlerError.firstNumberIsZero
        }
        
        guard duplicated(input) else {
            throw ShootRequestHandlerError.duplicated
        }
     }
    
    func initRequest(_ input: Format) throws -> ShootRequest {
        try ShootRequest(input)
    }
}


extension ShootRequestHandler {
    
    //checkErrors
    private func firstNumberIsZero(_ input: Format) -> Bool {
        input[0] == 0
    }
    
    //checkErrors
    private func duplicated(_ input: Format) -> Bool {
        input.count == Set(input).count
    }
}

