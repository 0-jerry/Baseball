//
//  RequestFormatter.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

protocol RequestHandler {
    
    associatedtype Request
    
    // 첫 인사 메세지 연산 메서드
    func welcomeMessage() -> String
    
    // 안내 메세지 연산 메서드
    func guideMessage() -> String
    
    // 에러 확인 메서드
    func checkErrors(_ input: String) throws
    
    // 요청 형태 반환 메서드
    func formatting(_ input: String) throws -> Request
}


extension RequestHandler {
    
    //입력 및 반환 메서드 (입력을 받아 Request를 전달)
    func input() -> Request {
        let welcomeMessage = welcomeMessage()
        print(welcomeMessage)
        
        //Request를 반환할 수 없는 응답을 받는다면 무한 반복
        while true {
            let guideMessage = guideMessage()
            print(guideMessage)
            
            do {
                let input = try readInput()
                try checkErrors(input)
                let request = try formatting(input)
                return request
            } catch {
                let errorMessage = String(describing: error)
                print("\n" + errorMessage)
            }
        }
    }
    
    //입력받기 메서드
    private func readInput() throws -> String {
        guard let input = readLine() else {
            throw RequestHandlerError.readLineFailed
        }
        return input
    }
}


