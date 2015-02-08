//
//  FeedTabViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/7/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class FeedTabViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var selectedShow: Show?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollViewWidth * 0.5))
        redView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(redView)
        
        // Trending Shows
        
        let trendingShowsLabel = UILabel(frame: CGRect(x: SideBuffer, y: redView.frame.maxY + SectionVerticleBuffer, width: scrollViewWidth, height: 20))
        trendingShowsLabel.text = "Trending Shows"
        scrollView.addSubview(trendingShowsLabel)
        
        let trendingShowsVerticleScrollView = HorizontalScrollView(frame: CGRect(x: 0, y: trendingShowsLabel.frame.maxY + ShortVerticleBuffer, width: scrollViewWidth, height: scrollViewWidth /
            3.5))
        trendingShowsVerticleScrollView.backgroundColor = UIColor.blueColor()
        trendingShowsVerticleScrollView.contentSize.width = scrollViewWidth * 2.0
        scrollView.addSubview(trendingShowsVerticleScrollView)
        // Build Verticle Scroll View
        
        let trendingShows = TheShowsManager.getTrendingShows()
        var lastShow: [ClickableShowTileImageView]?
        var indexOfLastShow:CGFloat = 0.0
        for show in trendingShows {
            let showTile = ClickableShowTileImageView(image: show.thumbnail, andShow: show)
            
            let imageViewTappedGesture = UITapGestureRecognizer(target: self, action: "showTileTapped:")
            showTile.userInteractionEnabled = true
            showTile.addGestureRecognizer(imageViewTappedGesture)
            
            showTile.frame = CGRect(
                origin: CGPoint(x: (SideBuffer * indexOfLastShow) + (scrollViewWidth / 3.5 * indexOfLastShow), y: 0),
                size: CGSize(width: scrollViewWidth / 3.5, height: scrollViewWidth / 3.5)
            )
            showTile.backgroundColor = UIColor.yellowColor()
            trendingShowsVerticleScrollView.addSubview(showTile)
            indexOfLastShow += 1.0
        }
        
        trendingShowsVerticleScrollView.compactContentSize()
        // End Build
        
        // Trending Challenges
        
//        let trendingShowsLabel = UILabel(frame: CGRect(x: SideBuffer, y: redView.frame.maxY + SectionVerticleBuffer, width: scrollViewWidth, height: 20))
//        trendingShowsLabel.text = "Trending Shows"
//        scrollView.addSubview(trendingShowsLabel)
//        
//        let trendingShowsVerticleScrollView = HorizontalScrollView(frame: CGRect(x: 0, y: trendingShowsLabel.frame.maxY + ShortVerticleBuffer, width: scrollViewWidth, height: scrollViewWidth /
//            3.5))
//        trendingShowsVerticleScrollView.backgroundColor = UIColor.blueColor()
//        trendingShowsVerticleScrollView.contentSize.width = scrollViewWidth * 2.0
//        scrollView.addSubview(trendingShowsVerticleScrollView)
//        // Build Verticle Scroll View
//        
//        let trendingShows = TheShowsManager.getTrendingShows()
//        var lastShow: [ClickableShowTileImageView]?
//        var indexOfLastShow:CGFloat = 0.0
//        for show in trendingShows {
//            let showTile = ClickableShowTileImageView(image: show.thumbnail, andShow: show)
//            
//            showTile.frame = CGRect(
//                origin: CGPoint(x: (SideBuffer * indexOfLastShow) + (scrollViewWidth / 3.5 * indexOfLastShow), y: 0),
//                size: CGSize(width: scrollViewWidth / 3.5, height: scrollViewWidth / 3.5)
//            )
//            showTile.backgroundColor = UIColor.yellowColor()
//            trendingShowsVerticleScrollView.addSubview(showTile)
//            indexOfLastShow += 1.0
//        }
//        
//        trendingShowsVerticleScrollView.compactContentSize()
//        // End Build
        
        
        // Mark: Implement what the page looks like above here
        
        setScrollHeight() // Compacts the page
    }
    
    func showTileTapped(gesture: UIGestureRecognizer) {
        let view = gesture.view as ClickableShowTileImageView
        let show = view.show
        
        selectedShow = show
    performSegueWithIdentifier("presentShowViewControllerFromFeed", sender: self)
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "presentShowViewControllerFromFeed" {
            println("Going to show view controller")
            let navViewController = segue.destinationViewController as UINavigationController
            let showViewController = navViewController.viewControllers[0] as ShowViewController
            
            println("Got destination")
            showViewController.show = selectedShow?
            println("set show for destination")
        }
    }
}
