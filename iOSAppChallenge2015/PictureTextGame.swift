//
//  PictureTextGame.swift
//  iOSAppChallenge2015
//
//  Created by Arthur Burgin on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit
class PictureTextGame{
    var show: Show
    var image: UIImage?
    var question: String
    var answer: String
    
    init(show: Show, image: UIImage, question: String, answer: String){
        self.show = show
        self.image = image
        self.question = question
        self.answer = answer
    }
}