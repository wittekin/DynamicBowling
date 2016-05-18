//
//  AddFutureRolesOnRoll.swift
//  Bowling
//
//  Created by Mark on 5/17/16.
//  Copyright © 2016 Mark. All rights reserved.
//

/// If the requiredFramePins are knocked down in this roll, numFutureRoles future rolls will be added to this frame's total score.
struct AddFutureRolesOnRoll: Rule {
    
    var roll: Int
    var requiredRollPins: Int
    var numFutureRoles: Int
    var desc: String
    
    init(roll: Int, requiredRollPins: Int, numFutureRoles: Int, desc: String) {
        self.roll = max(0, roll)
        self.requiredRollPins = max(0, requiredRollPins)
        self.numFutureRoles = max(0, numFutureRoles)
        self.desc = desc
    }
    
    mutating func scoreFrame(inout frame: Frame, frames: [Frame]) -> Bool {
        if roll >= frame.rolls.count { return false }
        
        if frame.rolls[roll] >= requiredRollPins {
            addFutureToFrame(&frame, frames: frames, rollsCount: numFutureRoles)
            frame.description = desc
            return true
        }
        return false
    }
}