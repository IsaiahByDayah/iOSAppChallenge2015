//
//  Challenge.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class Challenge {
    
    private struct SubStruct {
        static var id = 0
    }
    
    let id = SubStruct.id++
    
    let name: String
    let description: String
    var highScore = 0
    let show: Show
//    let scene: GameScene //TODO
    
    func play() {
        // TODO
        println("Playing Challenge")
    }
    
    func updateHighScore(score: Int) {
        if score > highScore { highScore = score }
    }
    
    init(name: String, description: String, show: Show, scene: String) {
        self.name = name
        self.description = description
        self.show = show
//        self.scene = scene // TODO
    }
}