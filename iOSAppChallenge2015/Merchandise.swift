//
//  Merchandise.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class Merchandise {
    
    private struct SubStruct {
        static var id = 0
    }
    
    let id = SubStruct.id++
    
    let show: Show
    let name: String
    let description: String
    let thumbnail: UIImage
    
    init(name: String, withDescription: String, withThumbnail: UIImage, forShow: Show){
        self.name = name
        self.description = withDescription
        self.thumbnail = withThumbnail
        self.show = forShow
    }
    
}