//
//  BaseballGame.swift
//  SecondMission
//
//  Created by 김시종 on 3/12/24.
//

import Foundation


class NumberChoice {
    
    
    var playerNumbers: [Int] = []
    var comNumbers: [Int] = []
    
    func GameStart() {
        print("1~9까지 숫자 중 세개의 숫자를 입력해주세요")
        
        //플레이어 숫자 입력 , 컴퓨터 랜덤 숫자 저장
        guard let input = readLine() else {
            print("입력이 없습니다.")
            return
        }
        playerNumbers = input.compactMap { Int(String($0)) }
        
        
        // 컴퓨터 랜덤숫자 설정
        var comChoice: [Int]
        repeat {
            let comNumber1: Int = Int.random(in: 1...9)
            let comNumber2: Int = Int.random(in: 1...9)
            let comNumber3: Int = Int.random(in: 1...9)
            
            comChoice = [comNumber1, comNumber2, comNumber3]
        } while Set(comChoice).count < 3
        comNumbers = comChoice
        
        

        // 플레이어 , 컴퓨터 숫자 비교 후 결과 도출
        guard playerNumbers.count == comNumbers.count else {
            print("세 개의 숫자를 입력해 주세요.")
            return
        }
        
        var strike = 0
        var ball = 0
        
        for i in 0..<playerNumbers.count {
            let playerNumer = playerNumbers[i]
            
            if comNumbers.contains(playerNumer) {
                strike += 1
            } else {
                ball += 1
            }
        }
        
        if strike > 0 {
            print("\(strike)스트라이크")
        }
        
        if ball > 0 {
            print("\(ball)볼")
        }
    }
}
    






