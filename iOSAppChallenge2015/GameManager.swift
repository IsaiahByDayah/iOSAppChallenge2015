//
//  GameManager.swift
//  iOSAppChallenge2015
//
//  Created by Arthur Burgin on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class GameManager{
    var multipleChoiceGame: [MultipleChoiceGame] = []
    var pictureTextGame: [PictureTextGame] = []
    var videoTextGame: [VideoTextGame] = []
    
    func addMCGame(show: Show, question: String, choices: [String]){
        var newGame = MultipleChoiceGame(show: show, question: question, choices: choices)
        multipleChoiceGame.append(newGame);
    }
    
    func addPTGame(show: Show, image: UIImage, question: String, answer: String){
        var newGame = PictureTextGame(show: show, image: image, question: question, answer: answer)
        pictureTextGame.append(newGame)
    }
    
    func addVTGame(show: Show, link: String){
        var newGame = VideoTextGame(show: show, link: link)
        videoTextGame.append(newGame)
    }
}