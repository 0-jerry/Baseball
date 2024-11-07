//
//  ShootRequestHandler.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/5/24.
//

import Foundation

//MARK: - 야구게임 숫자 입력 변환자
struct BaseballNumberConverter {
    
    //첫 숫자 0에 대한 확인 메서드
    private func firstNumberIsZero(_ input: Format) -> Bool {
        input[0] == 0
    }
    
    //숫자 중복 확인 메서드
    private func duplicated(_ input: Format) -> Bool {
        input.count == Set(input).count
    }
}


//MARK: - UserInputConvertible 프로토콜 준수
extension BaseballNumberConverter: UserInputConvertible {

    typealias Format = [Int]

    typealias Request = GuessNumber
    
    func guideMessage() -> String {
        "\(GameStatus.countOfNumbers) 자리의 숫자를 입력하세요."
    }
    
    func convertTo(_ input: String) throws -> Format {
        let input: Format = try input.map {
            guard let int = Int(String($0)) else {
                throw BaseballNumberConverterError.isNotNumber
            }
            return int
        }
        
        return input
    }
    
    func checkErrors(_ input: Format) throws {
        guard !firstNumberIsZero(input) else {
            throw BaseballNumberConverterError.firstNumberIsZero
        }
        
        guard duplicated(input) else {
            throw BaseballNumberConverterError.duplicated
        }
     }
    
    func initRequest(_ input: Format) throws -> GuessNumber {
        try GuessNumber(input)
    }
}
