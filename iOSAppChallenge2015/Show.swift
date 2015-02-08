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
    
    let name: String
    let description: String
    let keywords: [String]
    var episodes: [Episode]
    let thumbnail: UIImage
    var status: Int
    
    init(name: String, description: String, episodes: [Episode], thumbnail: UIImage, status: Int, keywords: [String]){
        self.name = name
        self.description = description
        self.episodes = episodes
        self.thumbnail = thumbnail
        self.status = status
        self.keywords = []
        for keyword in keywords {
            self.keywords.append(keyword.lowercaseString)
        }
    }
    
    func containsKeyword(keyword: String) -> Bool {
        let q = keyword.lowercaseString
        for keyword in keywords {
            if keyword == q {
                return true
            }
        }
        return false
    }
    
    //fix later
    /*func addEpisode(name: String, description: String){
        episodes.append(theEpisodeManager.);
    }*/
    
}