//
//  ShowsManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class ShowsManager {
    var shows: [Show] = []

    func addShow(name: String, withDescription: String, withImage: UIImage, withStatus: Int) ->Show {
        let newShow = Show(name: name, description: withDescription, episodes: []/*, thumbnail: withImage*/, status: withStatus)
        shows.append(newShow)
        return newShow
    }
    
    func getShow(id: Int) -> Show? {
        for show in shows{
            if show.id == id{
                return show
            }
        }
        return nil
    }
    
    func getTrendingShows() -> [Show]{
        //TODO
        return []
    }
    
    func searchShows(myQuery: String) -> [Show]{
        //TODO
        return []
    }
}