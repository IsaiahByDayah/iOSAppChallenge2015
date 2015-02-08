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
    
    let orange = UIColor(red: CGFloat(237)/255.0, green: CGFloat(175)/255.0, blue: CGFloat(20)/255.0, alpha: CGFloat(1.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
//        let statusHeight = UIApplication.sharedApplication().statusBarFrame.size.height
//        let navHeight = navigationController!.navigationBar.frame.size.height
//        
//        let screenSize = UIScreen.mainScreen().bounds
//        
//        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "pleasewritemeasong", size: 22)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
//        navigationController?.navigationBar.barTintColor = orange
//        navigationController?.navigationBar.translucent = false
//        
//        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: view.frame.size.height - navHeight - statusHeight)
//        
//        let containerSize = CGSize(width: scrollView.frame.size.width, height: (scrollView.frame.size.height * 2.0))
//        
//        scrollView.contentSize = containerSize
//        
//        let redView = UIView(frame: CGRect(x: 0, y: 100, width: scrollView.contentSize.width / 2.0, height: scrollView.contentSize.height / 2.0))
//        redView.backgroundColor = UIColor.redColor()
//        scrollView.addSubview(redView)
//        
//        let blackView = UIView(frame: CGRect(x: 0, y: redView.bounds.size.height - 100, width: redView.bounds.width / 2.0, height: 100))
//        blackView.backgroundColor = UIColor.blackColor()
//        redView.addSubview(blackView)
//        
//        setScrollHeight()
    }
    
    override func viewDidAppear(animated: Bool) {
        let statusHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navHeight = navigationController!.navigationBar.frame.size.height
        
        let screenSize = UIScreen.mainScreen().bounds
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "pleasewritemeasong", size: 22)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.barTintColor = orange
        navigationController?.navigationBar.translucent = false
        
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: view.frame.size.height)
        
        let containerSize = CGSize(width: scrollView.frame.size.width, height: (scrollView.frame.size.height * 2.0))
        
        scrollView.contentSize = containerSize
        
        let redView = UIView(frame: CGRect(x: 0, y: 100, width: scrollView.contentSize.width / 2.0, height: scrollView.contentSize.height / 2.0))
        redView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(redView)
        
        let blackView = UIView(frame: CGRect(x: 0, y: redView.bounds.size.height - 100, width: redView.bounds.width / 2.0, height: 100))
        blackView.backgroundColor = UIColor.blackColor()
        redView.addSubview(blackView)
        
        setScrollHeight()
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
