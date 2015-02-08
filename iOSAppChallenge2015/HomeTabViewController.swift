//
//  HomeTabViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/7/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class HomeTabViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let statusHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navHeight = navigationController!.navigationBar.frame.size.height
        
        let screenSize = UIScreen.mainScreen().bounds
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "pleasewritemeasong", size: 22)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.barTintColor = OrangeColor
        navigationController?.navigationBar.translucent = false
        
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: view.frame.size.height)
        
        let containerSize = CGSize(width: scrollView.frame.size.width, height: (scrollView.frame.size.height * 10.0)) // Make the contentSize bigger than needed
        
        scrollView.contentSize = containerSize
        
        let scrollViewWidth = scrollView.contentSize.width
        
        
        // Mark: Implement what the page looks like below here
        
        /* Examples for adding elements
        
        let redView = UIView(frame: CGRect(x: 0, y: 100, width: scrollView.contentSize.width / 2.0, height: 200))
        redView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(redView)
        
        let blackView = UIView(frame: CGRect(x: 0, y: redView.bounds.size.height - 100, width: redView.bounds.width / 2.0, height: 100))
        blackView.backgroundColor = UIColor.blackColor()
        redView.addSubview(blackView)
        
        
        
        let blueView = UIView(frame: CGRect(x: 0, y: 300, width: scrollView.contentSize.width / 2.0, height: 200))
        blueView.backgroundColor = UIColor.blueColor()
        scrollView.addSubview(blueView
        )
        
        let purpleView = UIView(frame: CGRect(x: 0, y: blueView.bounds.size.height - 100, width: blueView.bounds.width / 2.0, height: 100))
        purpleView.backgroundColor = UIColor.purpleColor()
        blueView.addSubview(purpleView)
        
        
        
        let browView = UIView(frame: CGRect(x: 0, y: 500, width: scrollView.contentSize.width / 2.0, height: 200))
        browView.backgroundColor = UIColor.brownColor()
        scrollView.addSubview(browView)
        
        let greyView = UIView(frame: CGRect(x: 0, y: browView.bounds.size.height - 100, width: browView.bounds.width / 2.0, height: 100))
        greyView.backgroundColor = UIColor.grayColor()
        browView.addSubview(greyView)

        */
        
        
        
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
