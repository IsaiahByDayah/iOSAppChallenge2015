//
//  VerticleScrollView.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class VerticleScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentSize.height = frame.size.height
    }
    
    func compactContentSize() {
        var scrollWidth: CGFloat = 0.0
        
        for view in subviews {
            if view.frame.maxX > scrollWidth {
                scrollWidth = view.frame.maxX
            }
        }
        
        contentSize.width = scrollWidth
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
