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
    var gameAttempts: [Int] = []
    var attemptCounts: Int = 0
    
    func GameStart() {
        
        // MARK: 컴퓨터 랜덤숫자 설정 (앞자리 0으로 선택되지 않도록 수정)
        
        var comChoice: [Int]
        repeat {
            let comNumber1: Int = Int.random(in: 1...9)
            let comNumber2: Int = Int.random(in: 0...9)
            let comNumber3: Int = Int.random(in: 0...9)
            
            comChoice = [comNumber1, comNumber2, comNumber3]
        } while Set(comChoice).count < 3
        comNumbers = comChoice
        
        
        

        
        var strike = 0
        var ball = 0
        var totalGame = 0
        var attemptCount = 0
        

        // MARK: 플레이어 입력 값 저장
        
        print("1~9까지 숫자 중 세 개의 숫자를 입력하세요")
        while true {
            guard let input = readLine()?.split(separator: "") else {
                print("세 개의 숫자를 입력해주세요")
                continue
            }
            let playerNumber = input.compactMap { Int(String($0)) }
            playerNumbers = playerNumber
            
            
        // MARK: 숫자는 세 개만 넣을 수 있고 같은 숫자는 넣을 수 없음 규칙 생성
            
            if playerNumbers.count != 3 {
                print("세 개의 숫자만 넣어주세요")
                continue
            } else if Set(playerNumbers).count != playerNumbers.count {
                print("같은 숫자는 입력할 수 없습니다.")
                continue
            } else if playerNumbers.first == 0 {
                print("0은 첫번째 자리에 올 수 없습니다.")
                continue
            }
            
            
        // MARK: 게임 시도 횟수 증가, 입력된 값 컴퓨터, 플레이어 비교
            
            attemptCounts = attemptCount
            
            
            if comNumbers.elementsEqual(playerNumbers) {
                print("정답입니다!!!")
                gameAttempts.append(attemptCount)
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
                
                print("\(strike)스트라이크, \(ball)볼")
                attemptCount += 1
                
            }
        }
    }
    
    // MARK: 게임시작 전 메뉴 선택 구현
    
    func SelectMenu() {
        while true {
            print("원하시는 항목을 선택해 주세요.")
            print("1. 게임 시작하기   2. 게임 기록 보기  3. 종료")
                
            if let choice = readLine(), let choiceInt = Int(choice) {
                switch choiceInt {
                case 1:
                    print("게임을 시작합니다.")
                    GameStart()
                    break
                case 2:
                    print("게임 기록을 표시합니다.")
                    GameRecords()
                    break
                case 3:
                    print("프로그램을 종료합니다.")
                    break
                default:
                    print("잘못된 입력입니다. 1, 2, 3 중에서 선택해주세요.")
                }
            } else {
                print("입력이 잘못되었습니다.")
            }
        }
    }
    
    func GameRecords() {
        guard !gameAttempts.isEmpty else {
            print("기록된 게임이 없습니다.")
            return
        }
        
        
        print("<게임 기록 보기>")
        for (index, attempt) in gameAttempts.enumerated() {
            print("\(index + 1)번째 게임 : 시도 횟수 \(attempt)회")
        }
    }
    
    
    
}
    






