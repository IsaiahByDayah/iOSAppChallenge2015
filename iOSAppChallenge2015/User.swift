//
//  User.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    private struct SubStruct {
        static var id = 0
    }
    
    let id = SubStruct.id++
    
    let username: String
    let password: String
    let profilePic: UIImage
    
    var shows: [Show] = []
    var comments: [Comment] {
        return [] // TODO
    }
    var photos: [Photo] {
        return [] // TOTO
    }
    
    init(username: String, password: String, profilePic: UIImage) {
        self.username = username
        self.password = password
        self.profilePic = profilePic
    }
}