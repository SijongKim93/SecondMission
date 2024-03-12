//
//  BaseballGame.swift
//  SecondMission
//
//  Created by 김시종 on 3/12/24.
//

import Foundation

class RandamNumber {
    
    func playerSelect(_ number1: Int, _ number2: Int, _ number3: Int) -> [Int] {
        let select = [number1, number2, number3]
        return select
    }

    
    //플레이어가 값을 입력
    func select() {
        guard let input = readLine() else {
            print("입력이 없습니다.")
            return
        }
        let numbers: [Int] = input.compactMap { Int(String($0)) }
        
        if numbers.count != 3 {
            print("세 개의 숫자를 입력해주세요.")
            return
        }
        
        let number1 = numbers[0]
        let number2 = numbers[1]
        let number3 = numbers[2]
        
    }
    
    //컴퓨터가 랜덤으로 값을 저장
    func start() {
        var comChoice: [Int]
        repeat {
            let comNumber1: Int = Int.random(in: 0...9)
            let comNumber2: Int = Int.random(in: 0...9)
            let comNumber3: Int = Int.random(in: 0...9)
            
            comChoice = [comNumber1, comNumber2, comNumber3]
        } while Set(comChoice).count < 3
        
        let comNumber1 = comChoice[0]
        let comNumber2 = comChoice[1]
        let comNumber3 = comChoice[2]
        
        //중복 값 제거
        print("컴퓨터가 선택한 값\(comChoice)")
    }
    
    
}
