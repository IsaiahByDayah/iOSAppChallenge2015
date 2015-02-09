//
//  ShowViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var show: Show?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = show!.name
    }

    override func viewDidAppear(animated: Bool) {
        
        let statusHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navHeight = navigationController!.navigationBar.frame.size.height
        
        let screenSize = UIScreen.mainScreen().bounds
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "pleasewritemeasong", size: 22)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.barTintColor = NavColor
        navigationController?.navigationBar.translucent = false
        
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: view.frame.size.height)
        
        let containerSize = CGSize(width: scrollView.frame.size.width, height: (scrollView.frame.size.height * 10.0)) // Make the contentSize bigger than needed
        
        scrollView.contentSize = containerSize
        
        let scrollViewWidth = scrollView.contentSize.width
        
        
        // Mark: Implement what the page looks like below here
        
        let font:UIFont? = UIFont(name: "Pleasewritemeasong", size: 17.0)
        
        let attrString = NSMutableAttributedString(
            string: show!.name,
            attributes: NSDictionary(
                object: font!,
                forKey: NSFontAttributeName))
        attrString.addAttribute(NSForegroundColorAttributeName, value: OrangeColor, range: NSMakeRange(0, attrString.length))
        
       let showTitleLabel = UILabel(frame: CGRect(x: SideBuffer, y: SectionVerticleBuffer, width: scrollViewWidth * 0.5, height: 20.0))
        showTitleLabel.attributedText = attrString
        
        scrollView.addSubview(showTitleLabel)
        
        let showThumbnail = UIImageView(frame: CGRect(x: showTitleLabel.frame.maxX, y: SectionVerticleBuffer, width: scrollViewWidth * 0.4, height: scrollViewWidth * 0.4))
        showThumbnail.backgroundColor = show?.primaryColor
        showThumbnail.image = show!.thumbnail
        scrollView.addSubview(showThumbnail)
        
        
        
        // Mark: Implement what the page looks like above here
        
        setScrollHeight() // Compacts the page
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setScrollHeight() {
        var scrollHeight: CGFloat = 0.0
        
        for view in scrollView.subviews {
            if view.frame.maxY > scrollHeight {
                scrollHeight = view.frame.maxY
            }
        }
        
        scrollView.contentSize.height = scrollHeight
    }
}
