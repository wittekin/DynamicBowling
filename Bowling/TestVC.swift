//
//  TestVC.swift
//  Bowling
//
//  Created by Mark on 5/17/16.
//  Copyright © 2016 Mark. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    let rollsPerFrame = 2
    let numPins = 10
    let framesPerGame = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testRolls1 = [10, 10, 10, 5, 5, 5, 5, 4, 6, 4, 3, 2, 4, -1, -1, 0, 3] // 134
        let testRolls2 = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] // 300
        let testRolls3 = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 5, 5] //285
        let testRolls4: [Int] = []
        let tests: [[Int]] = [testRolls1, testRolls2, testRolls3, testRolls4]
        
        let strike = AddFutureRolesOnRoll(roll: 0, requiredRollPins: 10, numFutureRoles: 2, desc: "Strike")
        let spare = AddFutureRolesOnTotal(requiredFramePins: 10, numFutureRoles: 1, desc: "Spare")
        let rules: [Rule] = [strike, spare]
        
        for test in tests {
            testGame(test, rules: rules)
            print("")
        }
        
    }
    
    func testGame(rolls: [Int], rules: [Rule]) {        
        var game = Game(rollsPerFrame: rollsPerFrame, numPins: numPins, framesPerGame: framesPerGame, rolls: rolls, rules: rules)
        game.runGame()
    }
}
