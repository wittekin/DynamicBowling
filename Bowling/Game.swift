//  Created by Mark on 5/17/16.
//  Copyright © 2016 Mark. All rights reserved.
//

/*TODO
 Validation:
    -Text validation of input rolls
    -All rolls in array fall in [0, 10]
    -Correct total number of frames
        -If not, prompt yes/no
            -Yes: update game to have that number of frames
            -No: Cancel game
    -Roll array not empty
 */

struct Frame {
    var rolls: [Int] = []
    var frameScore: Int = 0
    var id: Int = 0
    var description: String = "Open"
}

struct Game {
    // Inputs
    var rollsPerFrame: Int!
    var numPins: Int!
    var framesPerGame: Int!
    var rules: [Rule]!
    var rolls: [Int]!
    
    // Track state
    var totalScore = 0
    var frames: [Frame] = []
    
    init(rollsPerFrame: Int, numPins: Int, framesPerGame: Int, rolls: [Int], rules: [Rule]) {
        self.rolls = rolls
        self.rules = rules
        self.rollsPerFrame = rollsPerFrame
        self.numPins = numPins
        self.framesPerGame = framesPerGame
    }
    
    mutating func runGame() {
        buildFrames()
        scoreFrames()
    }
    
    mutating func buildFrames() {
        var frame = Frame()
        var frameID = 1
        var count = 0
        
        for roll in rolls {
            let pins = (roll > 0 ? roll : 0)
            if frame.rolls.count == 0 && pins == numPins {
                frame.rolls.append(pins)
                count = rollsPerFrame
            } else {
                frame.rolls.append(pins)
                count += 1
            }
            
            if count >= rollsPerFrame {
                count = 0
                frame.id = frameID
                frameID += 1
                frame.frameScore = frame.rolls.reduce(0, combine: +)
                frames.append(frame)
                frame = Frame()
            }
        }
    }
    
    mutating func scoreFrames() {
        let framesToScore = min (framesPerGame, frames.count)
        
        for i in 0..<framesToScore {
            for rule in rules {
                var ruleCopy = rule
                if (ruleCopy.scoreFrame(&frames[i], frames: frames)) {
                    break
                }
            }
            totalScore += frames[i].frameScore
            print("Frame \(frames[i].id): Rolls = \(frames[i].rolls), \(frames[i].description), Frame score = \(frames[i].frameScore), Running total: \(totalScore)")
        }
        
        for i in framesToScore..<frames.count {
            print("Extra Rolls = \(frames[i].rolls)")
        }
        print("Final game score: \(totalScore)")
    }
}

