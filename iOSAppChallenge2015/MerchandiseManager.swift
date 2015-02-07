//
//  MerchandiseManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class MerchandiseManager {
    
    var inventory: [Merchandise] = []
    
    func getMerchandise(id: Int) -> Merchandise? {
        for merchandise in inventory {
            if merchandise.id == id {
                return merchandise
            }
        }
        return nil
    }
    
    func getInventory(show: Show) -> [Merchandise] {
        var foundMerchandise: [Merchandise] = []
        for merchandise in inventory {
            if merchandise.show.id == show.id {
                foundMerchandise.append(merchandise)
            }
        }
        return foundMerchandise
    }
    
    func addMerchandise(name: String, withDescription: String, withThumbnail: UIImage, forShow: Show) -> Merchandise {
        let merchandise = Merchandise(name: name, description: withDescription, thumbnail: withThumbnail, show: forShow)
        inventory.append(merchandise)
        return merchandise
    }
}