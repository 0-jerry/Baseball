//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

struct TargetNumbers {
    
    static let numbers: Set<Int> = Set(0...9)
    
    let numbers: [Int]
    
    init() {
        var numbers = Array(Self.numbers.suffix(GameStatus.countOfBalls))
        while numbers[0] == 0 {
            numbers.shuffle()
        }
        
        self.numbers = numbers
    }
}
