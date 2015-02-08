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
        
//        let blueView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: 135))
//        blueView.backgroundColor = UIColor.blueColor()
//        scrollView.addSubview(blueView)
        
        let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        // Trending Shows
        
        let trendingShowsLabel = UILabel(frame: CGRect(x: SideBuffer, y: blueView.frame.maxY + SectionVerticleBuffer, width: scrollViewWidth, height: 20))
        trendingShowsLabel.text = "Trending Shows"
        scrollView.addSubview(trendingShowsLabel)
        
        let trendingShowsHorizontalScrollView = HorizontalScrollView(frame: CGRect(x: SideBuffer / 2.0, y: trendingShowsLabel.frame.maxY + ShortVerticleBuffer, width: scrollViewWidth - SideBuffer
            , height: scrollViewWidth /
            3.5))
        trendingShowsHorizontalScrollView.clipsToBounds = false
//        trendingShowsVerticleScrollView.backgroundColor = UIColor.blueColor()
        trendingShowsHorizontalScrollView.contentSize.width = scrollViewWidth * 2.0
        scrollView.addSubview(trendingShowsHorizontalScrollView)
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
            trendingShowsHorizontalScrollView.addSubview(showTile)
            indexOfLastShow += 1.0
        }
        
        trendingShowsHorizontalScrollView.compactContentSize()
        // End Build
        
        // Trending Challenges
        
        let trendingChallengesLabel = UILabel(frame: CGRect(x: SideBuffer, y: trendingShowsHorizontalScrollView.frame.maxY + SectionVerticleBuffer, width: scrollViewWidth, height: 20))
        trendingChallengesLabel.text = "Trending Challenges"
        scrollView.addSubview(trendingChallengesLabel)
        
        let trendingChallengesHorizontalScrollView = HorizontalScrollView(frame: CGRect(x: SideBuffer / 2.0, y: trendingChallengesLabel.frame.maxY + ShortVerticleBuffer, width: scrollViewWidth - SideBuffer, height: scrollViewWidth /
            2))
        trendingChallengesHorizontalScrollView.clipsToBounds = false
//        trendingChallengesHorizontalScrollView.backgroundColor = UIColor.greenColor()
        trendingChallengesHorizontalScrollView.contentSize.width = scrollViewWidth * 3.0
        scrollView.addSubview(trendingChallengesHorizontalScrollView)
        // Build Verticle Scroll View
        
        for var i: CGFloat = 0.0; i <= 4.0; i+=1.0 {
            let challengeTile = UIImageView(frame: CGRect(origin: CGPoint(x: (SideBuffer * i) + (scrollViewWidth / 2.0 * i), y: 0), size: CGSize(width: scrollViewWidth / 2.0, height: scrollViewWidth / 2.0)))
            
            challengeTile.backgroundColor = UIColor.grayColor()
            trendingChallengesHorizontalScrollView.addSubview(challengeTile)
        }
        
        trendingChallengesHorizontalScrollView.compactContentSize()
        // End Build
        
        // Trending Photos
        
        let trendingPhotosLabel = UILabel(frame: CGRect(x: SideBuffer, y: trendingChallengesHorizontalScrollView.frame.maxY + SectionVerticleBuffer, width: scrollViewWidth, height: 20))
        trendingPhotosLabel.text = "Trending Photos"
        scrollView.addSubview(trendingPhotosLabel)
        
        let trendingPhotosHorizontalScrollView = HorizontalScrollView(frame: CGRect(x: SideBuffer / 2.0, y: trendingPhotosLabel.frame.maxY + ShortVerticleBuffer, width: scrollViewWidth - SideBuffer, height: scrollViewWidth /
            2.75))
        trendingPhotosHorizontalScrollView.clipsToBounds = false
        //        trendingChallengesHorizontalScrollView.backgroundColor = UIColor.greenColor()
        trendingPhotosHorizontalScrollView.contentSize.width = scrollViewWidth * 3.0
        scrollView.addSubview(trendingPhotosHorizontalScrollView)
        // Build Verticle Scroll View
        
        for var i: CGFloat = 0.0; i <= 5.0; i+=1.0 {
            let photoTile = UIImageView(frame: CGRect(origin: CGPoint(x: (SideBuffer * i) + (scrollViewWidth / 2.75 * i), y: 0), size: CGSize(width: scrollViewWidth / 2.75, height: scrollViewWidth / 2.75)))
            
            photoTile.backgroundColor = UIColor.orangeColor()
            trendingPhotosHorizontalScrollView.addSubview(photoTile)
        }
        
        trendingPhotosHorizontalScrollView.compactContentSize()
        // End Build
        
        // Trending Discussions
        
        let trendingDiscussionsLabel = UILabel(frame: CGRect(x: SideBuffer, y: trendingPhotosHorizontalScrollView.frame.maxY + SectionVerticleBuffer, width: scrollViewWidth, height: 20))
        trendingDiscussionsLabel.text = "Trending Discussions"
        scrollView.addSubview(trendingDiscussionsLabel)
        
        let trendingDiscussionsHorizontalScrollView = HorizontalScrollView(frame: CGRect(x: SideBuffer / 2.25, y: trendingDiscussionsLabel.frame.maxY + ShortVerticleBuffer, width: scrollViewWidth - SideBuffer, height: scrollViewWidth /
            2.25))
        trendingDiscussionsHorizontalScrollView.clipsToBounds = false
        //        trendingChallengesHorizontalScrollView.backgroundColor = UIColor.greenColor()
        trendingDiscussionsHorizontalScrollView.contentSize.width = scrollViewWidth * 3.0
        scrollView.addSubview(trendingDiscussionsHorizontalScrollView)
        // Build Verticle Scroll View
        
        for var i: CGFloat = 0.0; i <= 5.0; i+=1.0 {
            let discussionTile = UIImageView(frame: CGRect(origin: CGPoint(x: (SideBuffer * i) + (scrollViewWidth / 2.25 * i), y: 0), size: CGSize(width: scrollViewWidth / 2.25, height: scrollViewWidth / 2.25)))
            
            discussionTile.backgroundColor = UIColor.greenColor()
            trendingDiscussionsHorizontalScrollView.addSubview(discussionTile)
        }
        
        trendingDiscussionsHorizontalScrollView.compactContentSize()
        // End Build
        
        
        // Mark: Implement what the page looks like above here
        
        setScrollHeight() // Compacts the page
        scrollView.contentSize.height += SectionVerticleBuffer
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
//            println("Going to show view controller")
            let navViewController = segue.destinationViewController as UINavigationController
            let showViewController = navViewController.viewControllers[0] as ShowViewController
            
//            println("Got destination")
            showViewController.show = selectedShow?
//            println("set show for destination")
        }
    }
}
