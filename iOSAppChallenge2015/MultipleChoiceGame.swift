//
//  MultipleChoiceGame.swift
//  iOSAppChallenge2015
//
//  Created by Arthur Burgin on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class MultipleChoiceGame{
    var show: Show
    var question: String
    var choices: [String]
    
    init(show:Show, question: String, choices:[String]){
        self.show = show
        self.question = question
        self.choices = choices
        
    }
}