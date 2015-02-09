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
        addShow("How I Met Your Mother", withDescription: "A comedy featuring flashbacks narrated to the protagonist’s kids about his experiences with love and meeting their mother. This series began in 2005 and has 9 seasons.", withImage: UIImage(named: "himym.jpg")!, withStatus: ShowStatus.Complete, withKeywords: ["How I Met Your Mother"], withPrimaryColor: UIColor(red: 70/255, green: 32/255, blue: 87/255, alpha: 1.0))
        addShow("Game of Thrones", withDescription: "An American fantasy drama where several families fight for control of the mythical land of Westeros. This series began in 2011 and the 5th season will soon start.", withImage: UIImage(named: "GoT.jpeg")!, withStatus: ShowStatus.Complete, withKeywords: ["Game of Thrones"], withPrimaryColor: UIColor(red: 136/255, green: 26/255, blue: 13/255, alpha: 1.0))
        addShow("Bob's Burgers", withDescription: "An animated comedy series about a family’s experiences with their burger restaurant. This series began in 2011 and 6 seasons.", withImage: UIImage(named: "BBurger.jpg")!, withStatus: ShowStatus.Complete, withKeywords: ["Bob's Burgers"], withPrimaryColor: UIColor(red: 36/255, green: 87/255, blue: 156/255, alpha: 1.0))
        addShow("American Horror Story: Murder House", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["American Horror Story: Murder House"], withPrimaryColor: UIColor.greenColor())
        addShow("American Horror Story: Asylum", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["American Horror Story: Asylum"], withPrimaryColor: UIColor.greenColor())
        addShow("American Horror Story: Coven", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["American Horror Story: Coven"], withPrimaryColor: UIColor.greenColor())
        addShow("American Horror Story: Freak Show", withDescription: "Test Description", withImage: UIImage(named: "logo.png")!, withStatus: ShowStatus.Complete, withKeywords: ["American Horror Story: Freak Show"], withPrimaryColor: UIColor.greenColor())
    }
}