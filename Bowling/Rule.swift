//
//  Rules.swift
//  Bowling
//
//  Created by Mark on 5/17/16.
//  Copyright © 2016 Mark. All rights reserved.
//

protocol Rule {
    mutating func scoreFrame(inout frame: Frame, frames: [Frame]) -> Bool
}

extension Rule where Self: Rule {
    func addFutureToFrame(inout frame: Frame, frames: [Frame], rollsCount: Int) {
        var numFutureRoles = rollsCount
        guard frames.count > frame.id else { return }
        numFutureRoles = min(numFutureRoles, countRemainingRolls(frame.id, frames: frames))

        var outerIndex = frame.id
        var innerIndex = 0
        
            while numFutureRoles > 0 {
                guard outerIndex < frames.count else { return }
                numFutureRoles -= 1
                frame.frameScore += frames[outerIndex].rolls[innerIndex]
                innerIndex += 1
                if innerIndex == frames[outerIndex].rolls.count {
                    innerIndex = 0
                    outerIndex += 1
                }
            }

    }
    
    func countRemainingRolls(frameID: Int, frames: [Frame]) -> Int {
        var remainingRolls = 0
        
        for i in frameID..<frames.count {
            for _ in frames[i].rolls {
                remainingRolls += 1
            }
        }
        return remainingRolls
    }
}