//
//  RequestFormatter.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//
import Foundation

//MARK: - 요청을 입력받고 지원하는 Request의 형태로 반환해주는 프로토콜
//associatedtype를 두 개 사용하게 된 것은 객체가 불명확한 형태를 가져서 그런 듯 하다.
//입력 -> 형식화 -> 검증 -> 요청형식
protocol RequestHandler {
    
    associatedtype Request
    associatedtype Format
    
    // 안내 메세지 연산 메서드
    func guideMessage() -> String
        
    // 요청 생성을 위한 형태로 변환
    func convertTo(_ input: String) throws -> Format
    
    // 에러 확인 메서드
    func checkErrors(_ input: Format) throws
    
    // 요청 형태 생성 메서드
    func initRequest(_ input: Format) throws -> Request
}


extension RequestHandler {
    
    //입력 및 반환 메서드 (입력을 받아 Request를 전달)
    func input() -> Request {
        let guideMessage = guideMessage()
        print(guideMessage)
        
        //Request를 반환할 수 없는 응답을 받는다면 무한 반복
        while true {
            do {
                let input = try readInput()
                let convertedInput = try convertTo(input)

                try checkErrors(convertedInput)
                let request = try initRequest(convertedInput)
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
