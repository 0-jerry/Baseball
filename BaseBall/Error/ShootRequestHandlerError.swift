//
//  ShootRequestHandlerError.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//


enum ShootRequestHandlerError: Error, CustomStringConvertible {
    
    case firstNumberIsZero
    case duplicated
    case isNotNumber
    case lengthIncorrect
    case unknown
    
    var description: String {
        switch self {
        case .firstNumberIsZero: return "첫 번째 숫자는 0이 될 수 없습니다."
        case .duplicated: return "숫자는 중복되어 사용될 수 없습니다."
        case .isNotNumber: return "숫자가 아닌 문자가 포함되어 있습니다."
        case .lengthIncorrect: return "\(GameRuler.countOfBalls) 자리의 숫자를 입력해주세요."
        case .unknown: return "알 수 없는 에러"
         }
    }
}
