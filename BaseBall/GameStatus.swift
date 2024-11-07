//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

//MARK: - 게임 관련 속성값 (숫자의 갯수, 총 목숨)
struct GameStatus {
    //게임에 사용될 숫자의 갯수
    private(set) static var countOfNumbers: Int = 5
    //게임에 시도할 수 있는 횟수
    private(set) static var lifeFullCount: Int = 10
    
    //게임에 사용될 숫자의 갯수를 설정 (사용방식 미구현)
    static func setCountOfNumbers(_ count: Int) {
        guard count <= 10 else { return }
        Self.countOfNumbers = count
    }
    
    //게임에 시도할 수 있는 횟수를 설정 (사용방식 미구현)
    static func setLifeFullCount(_ count: Int) {
        guard count > 0 else { return }
        Self.lifeFullCount = count
    }
}
