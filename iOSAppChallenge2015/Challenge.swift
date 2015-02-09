//
//  Challenge.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class Challenge {
    
    private struct SubStruct {
        static var id = 0
    }
    
    let id = SubStruct.id++
    
    var highScore = 0
    let show: Show
    let question: String
    let answer: String
    let image: UIImage
    
    func updateHighScore(score: Int) {
        if score > highScore { highScore = score }
    }
    
    init(question: String, answer: String, show: Show, image: UIImage) {
        self.question = question
        self.answer = answer
        self.show = show
        self.image = image
    }
}