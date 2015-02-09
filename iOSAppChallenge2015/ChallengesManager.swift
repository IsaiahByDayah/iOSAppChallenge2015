//
//  ChallengesManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class ChallengesManager {
    
    var challenges: [Challenge] = []
    
    func addChallenge(question: String, withAnswer: String,  forShow: Show, withImage: UIImage) -> Challenge {
        let challenge = Challenge(question: question, answer: withAnswer, show: forShow, image: withImage)
        challenges.append(challenge)
        return challenge
    }
    
    func getChallenge(id: Int) -> Challenge? {
        for challenge in challenges {
            if challenge.id == id {
                return challenge
            }
        }
        return nil
    }
    
    func getChallenges(show: Show) -> [Challenge] {
        var foundChallenges: [Challenge] = []
        for challenge in challenges {
            if challenge.show.id == show.id {
                foundChallenges.append(challenge)
            }
        }
        return foundChallenges
    }
    
}