//
//  ClickableShowTileImageView.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class ClickableShowTileImageView: UIImageView {

    var show: Show?
    
    init(image: UIImage!, andShow: Show?) {
        super.init(image: image)
        
        userInteractionEnabled = true
        self.show = andShow
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
