//
//  main.swift
//  SecondMission
//
//  Created by 김시종 on 3/12/24.
//

import Foundation

class BaseballGame {
    func start() {
        print("숫자 야구 게임을 시작합니다.")
        let randomChoice = NumberChoice()
        randomChoice.GameStart()
    }
}

let game = BaseballGame()
game.start()


