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
    
    private struct SubStruct {
        static var id = 0
    }
    
    let id = SubStruct.id++
    
    var name: String
    var description: String
    var episodes: [Episode]
    var thumbnail: UIImage
    var status: Int
    
    init(name: String, description: String, episodes: [Episode], thumbnail: UIImage, status: Int){
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