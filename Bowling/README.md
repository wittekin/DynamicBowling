DynamicBowling

Usage instructions:
Open project in Xcode, edit TestVC.swift with your custom test cases, run.

----------------------

Example input and output:
INPUT: [10, 10, 10, 5, 5, 5, 5, 4, 6, 4, 3, 2, 4, 0, 0, 0, 3] OR [10, 10, 10, 5, 5, 5, 5, 4, 6, 4, 3, 2, 4, -1, -1, 0, 3]
OUTPUT:
Frame 1: Rolls = [10], Strike, Frame score = 30, Running total: 30
Frame 2: Rolls = [10], Strike, Frame score = 25, Running total: 55
Frame 3: Rolls = [10], Strike, Frame score = 20, Running total: 75
Frame 4: Rolls = [5, 5], Spare, Frame score = 15, Running total: 90
Frame 5: Rolls = [5, 5], Spare, Frame score = 14, Running total: 104
Frame 6: Rolls = [4, 6], Spare, Frame score = 14, Running total: 118
Frame 7: Rolls = [4, 3], Open, Frame score = 7, Running total: 125
Frame 8: Rolls = [2, 4], Open, Frame score = 6, Running total: 131
Frame 9: Rolls = [0, 0], Open, Frame score = 0, Running total: 131
Frame 10: Rolls = [0, 3], Open, Frame score = 3, Running total: 134
Final game score: 134

INPUT: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
OUTPUT:
Frame 1: Rolls = [10], Strike, Frame score = 30, Running total: 30
Frame 2: Rolls = [10], Strike, Frame score = 30, Running total: 60
Frame 3: Rolls = [10], Strike, Frame score = 30, Running total: 90
Frame 4: Rolls = [10], Strike, Frame score = 30, Running total: 120
Frame 5: Rolls = [10], Strike, Frame score = 30, Running total: 150
Frame 6: Rolls = [10], Strike, Frame score = 30, Running total: 180
Frame 7: Rolls = [10], Strike, Frame score = 30, Running total: 210
Frame 8: Rolls = [10], Strike, Frame score = 30, Running total: 240
Frame 9: Rolls = [10], Strike, Frame score = 30, Running total: 270
Frame 10: Rolls = [10], Strike, Frame score = 30, Running total: 300
Extra Rolls = [10]
Extra Rolls = [10]
Final game score: 300

INPUT: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 5, 5]
OUTPUT:
Frame 1: Rolls = [10], Strike, Frame score = 30, Running total: 30
Frame 2: Rolls = [10], Strike, Frame score = 30, Running total: 60
Frame 3: Rolls = [10], Strike, Frame score = 30, Running total: 90
Frame 4: Rolls = [10], Strike, Frame score = 30, Running total: 120
Frame 5: Rolls = [10], Strike, Frame score = 30, Running total: 150
Frame 6: Rolls = [10], Strike, Frame score = 30, Running total: 180
Frame 7: Rolls = [10], Strike, Frame score = 30, Running total: 210
Frame 8: Rolls = [10], Strike, Frame score = 30, Running total: 240
Frame 9: Rolls = [10], Strike, Frame score = 25, Running total: 265
Frame 10: Rolls = [10], Strike, Frame score = 20, Running total: 285
Extra Rolls = [5, 5]
Final game score: 285

INPUT: []
OUTPUT:
Final game score: 0