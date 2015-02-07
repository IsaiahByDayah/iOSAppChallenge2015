//
//  Episode.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class Episode {
    
    var name: String = ""
    var id: Int = 0
    var description: String = ""
    var shows: Show
    
    init(name: String,description: String, shows: Show){
        self.name = name
        self.description = description
        self.shows = shows
    }
    
    
    
}