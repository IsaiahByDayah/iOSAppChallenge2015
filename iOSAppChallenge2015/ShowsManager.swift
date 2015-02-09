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

    func addShow(name: String, withDescription: String, withImage: UIImage, withStatus: Int, withKeywords: [String], withPrimaryColor: UIColor) ->Show {
        let newShow = Show(name: name, description: withDescription, episodes: [], thumbnail: withImage, status: withStatus, keywords: withKeywords, color: withPrimaryColor)
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
//        return []
        return shows
    }
    
    func searchShows(myQuery: String) -> [Show]{
        var showResults: [Show] = []
        
        for show in shows {
            if (show.name.lowercaseString.hasPrefix(myQuery.lowercaseString)) || show.containsKeyword(myQuery) {
                showResults.append(show)
            }
        }
        
        return showResults
    }
    
    init() {
        addShow("Test Show", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["Test"], withPrimaryColor: UIColor.greenColor())
        addShow("Test Show 2", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["Test"], withPrimaryColor: UIColor.greenColor())
        addShow("Test Show 3", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["Test"], withPrimaryColor: UIColor.greenColor())
        addShow("Test Show 4", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["Test"], withPrimaryColor: UIColor.greenColor())
    }
}