//
//  AddFutureRolesOnTotal.swift
//  Bowling
//
//  Created by Mark on 5/17/16.
//  Copyright © 2016 Mark. All rights reserved.
//

///If the requiredFramePins are knocked down in this frame, numFutureRoles future rolls will be added to this frame's total score.
struct AddFutureRolesOnTotal: Rule {
    
    
    var requiredFramePins: Int
    var numFutureRoles: Int
    var desc: String
    
    init(requiredFramePins: Int, numFutureRoles: Int, desc: String) {
        self.requiredFramePins = max(requiredFramePins, 0)
        self.numFutureRoles = max(numFutureRoles, 0)
        self.desc = desc
    }
    
    mutating func scoreFrame(inout frame: Frame, frames: [Frame]) -> Bool {
        if frame.rolls.reduce(0, combine: +) >= requiredFramePins {
            addFutureToFrame(&frame, frames: frames, rollsCount: numFutureRoles)
            frame.description = desc
            return true
        }
        return false
    }
}