//
//  ChallengesManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class ChallengesManager {
    
    var challenges: [Challenge] = []
    
    func addChallenge(name: String, withDescription: String, withScene: String, forShow: Show) -> Challenge {
        let challenge = Challenge(name: name, description: withDescription, show: forShow, scene: withScene)
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
            // TODO
//            if challenge.show.id == show.id {
//                foundChallenges.append(challenge)
//            }
        }
        return foundChallenges
    }
    
}