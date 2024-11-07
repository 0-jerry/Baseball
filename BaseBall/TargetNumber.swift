//
//  Untitled.swift
//  BaseBall
//
//  Created by t2023-m0072 on 11/6/24.
//

import Foundation

//MARK: - 목표 숫자 자동 생성 구조체
struct TargetNumber {
        
    let numbers: [Int]
    
    //생성자에서 연산을 통해 랜덤 숫자 연산
    init() {
        //0~9 에서 (GameStatus.countOfNumbers)만큼의 랜덤 미중복 숫자 배열
        var numbers = Array<Int>(0...9)
            .shuffled()
            .suffix(GameStatus.countOfNumbers)
            .map { Int($0) }
                
        //첫 자리 숫자가 0이 아닐때 까지 셔플
        while numbers[0] == 0 {
            numbers.shuffle()
        }
        
        self.numbers = numbers
    }
}
