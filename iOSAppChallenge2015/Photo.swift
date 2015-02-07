//
//  Photo.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    
    private struct SubStruct {
        static var id = 0
    }
    
    let id = SubStruct.id++
    
    let user: User
    let show: Show
    let source: UIImage
    
    init(user: User, show: Show, source: UIImage) {
        self.user = user
        self.show = show
        self.source = source
    }
}