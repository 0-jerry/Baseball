//
//  RequestFormatter.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//
import Foundation

//MARK: - 요청을 입력받고 지원하는 Request의 형태로 반환해주는 프로토콜
//associatedtype를 두 개 사용하게 된 것은 객체가 불명확한 형태를 가져서 그런 듯 하다.
//가능하다면 associatedtype을 각각 사용하는 두개의 프로토콜로 구현했으면 좋았을 듯 하다.
//입력 -> 형식화 -> 검증 -> 요청형식

//MARK: - 입력 변환자 프로토콜
protocol UserInputConvertible {
    
    //Request 타입을 생성하기 위한 타입
    associatedtype Format
    
    //최종적으로 반환할 Request 타입
    associatedtype Request
    
    // 안내 메세지 연산 메서드
    func guideMessage() -> String
    
    // 요청 생성을 위한 형태로 변환
    func convertTo(_ input: String) throws -> Format
    
    // 에러 확인 메서드
    func checkErrors(_ input: Format) throws
    
    // 요청 형태 생성 메서드
    func initRequest(_ input: Format) throws -> Request
}


extension UserInputConvertible {
    
    //입력 및 반환 메서드 (입력을 받아 Request를 전달)
    func input() -> Request {
        
        //Request를 반환할 수 없는 응답을 받는다면 무한 반복
        while true {
            
            //가이드 메세지 출력
            let guideMessage = guideMessage()
            print(guideMessage)
            
            //유저 입력 라인 표시 출력
            print("> ", terminator: "")
            
            do {
                //유저 입력 검증 및 할당
                let input = try readInput()
                
                //입력 값을 Format 형태로 변환
                let convertedInput = try convertTo(input)
                
                //입력 값 검증
                try checkErrors(convertedInput)
                
                //Format 타입의 검증된 입력값을 Request 타입으로 초기화 및 반환
                let request = try initRequest(convertedInput)
                return request
                
            } catch {
                
                //에러 메세지 연산 및 출력
                let errorMessage = String(describing: error)
                print("\n" + "( " + errorMessage + " )")
            }
        }
    }
    
    //입력받기 메서드
    private func readInput() throws -> String {
        guard let input = readLine() else {
            throw UserInputConvertibleError.readLineFailed
        }
        
        return input
    }
}
