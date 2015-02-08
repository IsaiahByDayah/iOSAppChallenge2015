//
//  HomeTabViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/7/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class HomeTabViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var circle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        circle = UIImageView()
        circle.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let statusHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navHeight = navigationController!.navigationBar.frame.size.height
        
        let screenSize = UIScreen.mainScreen().bounds
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "pleasewritemeasong", size: 22)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.barTintColor = NavColor
        navigationController?.navigationBar.translucent = false
        
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: view.frame.size.height)
        
        let containerSize = CGSize(width: scrollView.frame.size.width, height: (scrollView.frame.size.height * 1000.0)) // Make the contentSize bigger than needed
        
        scrollView.contentSize = containerSize
        
        let scrollViewWidth = scrollView.contentSize.width
        
        // Mark: Implement what the page looks like below here
        
        // Examples for adding elements
        
        
        let bannerView = UIView(frame: CGRect(x: 0, y: 0, width: scrollViewWidth, height: 135))
        //enter show thumbnail in banner
        for show in TheUsersManager.currentUser!.shows{
        }
        bannerView.backgroundColor = UIColor.blueColor()
        scrollView.addSubview(bannerView)
    
        circle.frame = CGRect(x: scrollViewWidth / 2.0 - 60.0, y: 70, width: 120, height: 120)
        circle.layer.cornerRadius = CGFloat(circle!.frame.size.width / 2.0)
        circle.clipsToBounds = true
        circle.backgroundColor = UIColor.lightGrayColor()
        circle.image = TheUsersManager.currentUser!.profilePic
        scrollView.addSubview(circle!)
        
        let imageViewTappedGesture = UITapGestureRecognizer(target: self, action: "imageViewTapped:")
        circle!.userInteractionEnabled = true
        circle!.addGestureRecognizer(imageViewTappedGesture)
        
        let section1 = UILabel(frame: CGRect(x: 15, y: 190, width: scrollViewWidth, height: 15))
        section1.text = "MyShows"
        scrollView.addSubview(section1)
        
        // Shows
        
        let showsScrollView = HorizontalScrollView(frame: CGRect(x: SideBuffer / 2.0, y: section1.frame.maxY + ShortVerticleBuffer, width: scrollViewWidth - SideBuffer
            , height: scrollViewWidth /
            3.5))
        showsScrollView.clipsToBounds = false
        //        trendingShowsVerticleScrollView.backgroundColor = UIColor.blueColor()
        showsScrollView.contentSize.width = scrollViewWidth * 3.0
        scrollView.addSubview(showsScrollView)
        // Build Verticle Scroll View
        
        let show1 = UIView(frame: CGRect(x: (SideBuffer * 0) + (scrollViewWidth / 3.5 * 0), y: 0, width: scrollViewWidth/3.5, height:scrollViewWidth/3.5))
        show1.backgroundColor = UIColor.redColor()
        showsScrollView.addSubview(show1)
        
        let show2 = UIView(frame: CGRect(x: (SideBuffer * 1) + (scrollViewWidth / 3.5 * 1), y: 0, width: scrollViewWidth/3.5, height: scrollViewWidth/3.5))
        show2.backgroundColor = UIColor.redColor()
        showsScrollView.addSubview(show2)
        
        let show3 = UIView(frame: CGRect(x: (SideBuffer * 2) + (scrollViewWidth / 3.5 * 2), y: 0, width: scrollViewWidth/3.5, height: scrollViewWidth/3.5))
        show3.backgroundColor = UIColor.redColor()
        showsScrollView.addSubview(show3)
        
        let show4 = UIView(frame: CGRect(x: (SideBuffer * 3) + (scrollViewWidth / 3.5 * 3), y: 0, width: scrollViewWidth/3.5, height: scrollViewWidth/3.5))
        show4.backgroundColor = UIColor.redColor()
        showsScrollView.addSubview(show4)

        showsScrollView.compactContentSize()
        // End Build
        
        let section2 = UILabel(frame: CGRect(x: 15, y: 345, width: scrollViewWidth, height: 20))
        section2.text = "Challenge Trophies"
        scrollView.addSubview(section2)
        
        let challengeTrophie1 = UIView(frame: CGRect(x: 15, y: 375, width: scrollViewWidth/2, height: 170))
        challengeTrophie1.backgroundColor = UIColor.greenColor()
        scrollView.addSubview(challengeTrophie1)
        
        let challengeTrophie2 = UIView(frame: CGRect(x: 35+(scrollViewWidth/2), y: 375, width: scrollViewWidth/2, height: 170))
        challengeTrophie2.backgroundColor = UIColor.greenColor()
        scrollView.addSubview(challengeTrophie2)
        
        let section3 = UILabel(frame: CGRect(x: 15, y: 555, width: scrollViewWidth, height: 20))
        section3.text = "Discussion Posts"
        scrollView.addSubview(section3)
        
        let discussionPost1 = UIView(frame: CGRect(x: 15, y: 585, width: scrollViewWidth/2, height: 165))
        discussionPost1.backgroundColor = UIColor.yellowColor()
        scrollView.addSubview(discussionPost1)
        
        let discussionPost2 = UIView(frame: CGRect(x: 35+(scrollViewWidth/2), y: 585, width: scrollViewWidth/2, height: 165))
        discussionPost2.backgroundColor = UIColor.yellowColor()
        scrollView.addSubview(discussionPost2)
        
        let section4 = UILabel(frame: CGRect(x: 15, y: 760, width: scrollViewWidth, height: 20))
        section4.text = "Photos"
        scrollView.addSubview(section4)
        
        let pic1 = UIView(frame: CGRect(x: 15, y: 790, width: 115, height: 105))
        pic1.backgroundColor = UIColor.orangeColor()
        scrollView.addSubview(pic1)
        
        let pic2 = UIView(frame: CGRect(x: 145, y: 790, width: 115, height: 105))
        pic2.backgroundColor = UIColor.orangeColor()
        scrollView.addSubview(pic2)
        
        let pic3 = UIView(frame: CGRect(x: 275, y: 790, width: 115, height: 105))
        pic3.backgroundColor = UIColor.orangeColor()
        scrollView.addSubview(pic3)
        
        /*
    
        let redView = UIView(frame: CGRect(x: 0, y: 100, width: scrollView.contentSize.width / 2.0, height: 200))
        redView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(redView)
        
        let yellowView = UIView(frame: CGRect(x: 0, y: 200, width: scrollViewWidth, height: 200))
        yellowView.backgroundColor = UIColor.blueColor()
        scrollView.addSubview(yellowView)
        
        
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
    
    func imageViewTapped(gesture: UIGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
        circle.image = photo
        TheUsersManager.currentUser?.profilePic = photo
        dismissViewControllerAnimated(true, completion: nil)
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
