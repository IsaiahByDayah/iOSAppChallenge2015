//
//  Show.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class Show {
    var name: String = ""
    var id: Int = 0
    var description: String = ""
    var episodes: [Episode] = []
    var thumbnail: UIImage
    var status: String = ""
    
    init(name: String, description: String, episodes: [Episode], thumbnail: UIImage, status: String ){
        self.name = name
        self.description = description
        self.episodes = episodes
        self.thumbnail = thumbnail
        self.status = status
    }
    
    //fix later
    /*func addEpisode(name: String, description: String){
        episodes.append(theEpisodeManager.);
    }*/
    
}