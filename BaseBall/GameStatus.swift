//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

// 게임 관련 속성값 (공의 갯수, 총 목숨)
struct GameStatus {
    private(set) static var countOfBalls: Int = 3
    
    private(set) static var lifeFullCount: Int = 1
    
    static func setCountOfBalls(_ count: Int) {
        guard count <= 9 else { return }
        Self.countOfBalls = count
    }
    
    static func setLifeFullCount(_ count: Int) {
        guard count > 0 else { return }
        Self.lifeFullCount = count
    }
}
