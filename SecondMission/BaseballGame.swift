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
        
        // MARK: 컴퓨터 랜덤숫자 설정
        
        var comChoice: [Int]
        repeat {
            let comNumber1: Int = Int.random(in: 1...9)
            let comNumber2: Int = Int.random(in: 1...9)
            let comNumber3: Int = Int.random(in: 1...9)
            
            comChoice = [comNumber1, comNumber2, comNumber3]
        } while Set(comChoice).count < 3
        comNumbers = comChoice
        
        
        

        
        var strike = 0
        var ball = 0
        var attemptCount = 0

        // MARK: 플레이어 입력 값 저장
        
        while true {
            print("1~9까지 숫자 중 세 개의 숫자를 입력하세요")
            guard let input = readLine()?.split(separator: "") else {
                print("세 개의 숫자를 입력해주세요")
                continue
            }
            let playerNumber = input.compactMap { Int(String($0)) }
            playerNumbers = playerNumber
            
            
        // MARK: 숫자 세 개만 넣을 수 있도록 안내 후 재진행
            
            if playerNumbers.count != 3 {
                print("세 개의 숫자만 넣어주세요")
                continue
            }
            
            
        // MARK: 게임 시도 횟수, 입력된 값 컴퓨터, 플레이어 비교
            attemptCount += 1
            
            if comNumbers.elementsEqual(playerNumbers) {
                print("정답입니다!!!")
                break
            } else {
                strike = 0
                ball = 0
                for i in 0..<playerNumbers.count {
                    if comNumbers[i] == playerNumbers[i] {
                        strike += 1
                    } else if comNumbers.contains(playerNumbers[i]) {
                        ball += 1
                    }
                }
                
                print("\(strike)스트라이크, \(ball)볼") //attemptCount 시도횟수는 다음레벨에 사용예정
                
            }
        }
       
    }
}
    






