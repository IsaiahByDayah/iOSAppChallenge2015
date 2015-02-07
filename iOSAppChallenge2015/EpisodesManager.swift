//
//  EpisodeManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class EpisodesManager {
    
    var episodes: [Episode] = []
    
    func getEpisdode(id: Int) -> Episode?{
        for episode in episodes{
            if episode.id == id{
                return episode
            }
        }
        return nil
    }
    
    func addEpisode(name: String, withDescription: String, forShow: Show) -> Episode{
        var newEpisode = Episode(name: name, description: withDescription, shows: forShow)
        episodes.append(newEpisode)
        return newEpisode
    }
}