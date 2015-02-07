//
//  Comment.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class Comment {
    
    private struct SubStruct {
        static var id = 0
    }
    
    let id = SubStruct.id++
    
    var text: String
    var user: User
    var shows: Show
    
    init(text: String, user: User, shows: Show) {
        self.text = text
        self.user = user
        self.shows = shows
    }
    
    
}