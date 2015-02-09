//
//  ShowViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
       let showTitleLabel = UILabel(frame: CGRect(x: scrollViewWidth * 0.05, y: SectionVerticleBuffer, width: scrollViewWidth * 0.5, height: 20.0))
        showTitleLabel.textColor = OrangeColor
        showTitleLabel.text = show!.name
        
        scrollView.addSubview(showTitleLabel)
        
        let showThumbnail = UIImageView(frame: CGRect(x: scrollViewWidth * 0.6, y: SectionVerticleBuffer, width: scrollViewWidth * 0.35, height: scrollViewWidth * 0.35))
        showThumbnail.backgroundColor = show?.primaryColor
        showThumbnail.image = show!.thumbnail
        scrollView.addSubview(showThumbnail)
        
        let showStatusView = UIView(frame: CGRect(x: showThumbnail.frame.minX + showThumbnail.frame.size.width * 0.2, y: showThumbnail.frame.maxY, width: showThumbnail.frame.size.width * 0.8, height: scrollViewWidth * 0.10))
        showStatusView.backgroundColor = show!.primaryColor
        scrollView.addSubview(showStatusView)
        
        let showStatusLabel = UILabel(frame: CGRect(x: 0, y: 0, width: showStatusView.frame.width, height: showStatusView.frame.height))
        showStatusLabel.textColor = UIColor.whiteColor()
        showStatusLabel.text = show!.statusText()
        showStatusLabel.textAlignment = NSTextAlignment.Center
        showStatusView.addSubview(showStatusLabel)
        
        let showDescriptionTextArea = UITextView(frame: CGRect(x: SideBuffer, y: showTitleLabel.frame.maxY + scrollViewWidth * 0.05, width: scrollViewWidth * 0.5, height: scrollViewWidth * 0.35
            ))
        showDescriptionTextArea.text = show?.description
        scrollView.addSubview(showDescriptionTextArea)
        
        let challengesLabel = UILabel(frame: CGRect(x: scrollViewWidth * 0.05, y: showDescriptionTextArea.frame.maxY + 30.0, width: scrollViewWidth * 0.9, height: 20.0))
        challengesLabel.text = "Challenges"
        scrollView.addSubview(challengesLabel)
        
        var challenges = TheChallengesManager.getChallenges(show!)
        
        if challenges.count > 0 {
            let challenge1 = UITextView(frame: CGRect(x: scrollViewWidth * 0.04, y: challengesLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
            challenge1.backgroundColor = show!.primaryColor
            challenge1.textColor = UIColor.whiteColor()
            challenge1.textAlignment = NSTextAlignment.Center
            challenge1.font = UIFont.boldSystemFontOfSize(16.0)
            challenge1.text = "\n\nGuess Who?"
            scrollView.addSubview(challenge1)
        }
        
        if challenges.count > 1 {
            let challenge2 = UITextView(frame: CGRect(x: scrollViewWidth * 0.36, y: challengesLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
            challenge2.backgroundColor = show!.primaryColor
            challenge2.textColor = UIColor.whiteColor()
            challenge2.textAlignment = NSTextAlignment.Center
            challenge2.font = UIFont.boldSystemFontOfSize(16.0)
            challenge2.text = "\n\nTrivia"
            scrollView.addSubview(challenge2)
        }
        
        if challenges.count > 2 {
            let challenge3 = UITextView(frame: CGRect(x: scrollViewWidth * 0.68, y: challengesLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
            challenge3.backgroundColor = show!.primaryColor
            challenge3.textColor = UIColor.whiteColor()
            challenge3.textAlignment = NSTextAlignment.Center
            challenge3.font = UIFont.boldSystemFontOfSize(16.0)
            challenge3.text = "\n\nQuotes"
            scrollView.addSubview(challenge3)
        }
        
        let photosLabel = UILabel(frame: CGRect(x: scrollViewWidth * 0.05, y: challengesLabel.frame.maxY + scrollViewWidth * 0.28 + 30.0, width: scrollViewWidth * 0.9, height: 20.0))
        photosLabel.text = "Photos"
        scrollView.addSubview(photosLabel)
        
        let addPhoto = UIButton(frame: CGRect(x: scrollViewWidth * 0.04, y: photosLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
        addPhoto.addTarget(self, action: "addPhoto:", forControlEvents: UIControlEvents.TouchUpInside)
        addPhoto.imageView?.image = UIImage(named: "Camera_icon_show.png")
        addPhoto.backgroundColor = UIColor.lightGrayColor()
        scrollView.addSubview(addPhoto)
        
        var photos = ThePhotosManager.getPhotos(show!)
        
        if photos.count > 0 {
            let photo1 = UIImageView(frame: CGRect(x: scrollViewWidth * 0.36, y: photosLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
            photo1.image = photos[0].source
            photo1.backgroundColor = show!.primaryColor
            scrollView.addSubview(photo1)
        }
        
        if photos.count > 1 {
            let photo2 = UIImageView(frame: CGRect(x: scrollViewWidth * 0.68, y: photosLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
            photo2.image = photos[1].source
            photo2.backgroundColor = show!.primaryColor
            scrollView.addSubview(photo2)
        }
        
        let merchLabel = UILabel(frame: CGRect(x: scrollViewWidth * 0.05, y: photosLabel.frame.maxY + scrollViewWidth * 0.28 + 30.0, width: scrollViewWidth * 0.9, height: 20.0))
        merchLabel.text = "Merchandise"
        scrollView.addSubview(merchLabel)
        
        let merch1 = UITextView(frame: CGRect(x: scrollViewWidth * 0.04, y: merchLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
        merch1.backgroundColor = show!.primaryColor
        merch1.textAlignment = NSTextAlignment.Center
        merch1.font = UIFont.boldSystemFontOfSize(16.0)
        merch1.textColor = UIColor.whiteColor()
        merch1.text = "\n\nShirts"
        scrollView.addSubview(merch1)
        
        let merch2 = UITextView(frame: CGRect(x: scrollViewWidth * 0.36, y: merchLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
        merch2.backgroundColor = show!.primaryColor
        merch2.textAlignment = NSTextAlignment.Center
        merch2.font = UIFont.boldSystemFontOfSize(16.0)
        merch2.textColor = UIColor.whiteColor()
        merch2.text = "\n\nArt"
        scrollView.addSubview(merch2)
        
        let merch3 = UITextView(frame: CGRect(x: scrollViewWidth * 0.68, y: merchLabel.frame.maxY + 15.0, width: scrollViewWidth * 0.28, height: scrollViewWidth * 0.28))
        merch3.backgroundColor = show!.primaryColor
        merch3.textAlignment = NSTextAlignment.Center
        merch3.font = UIFont.boldSystemFontOfSize(16.0)
        merch3.textColor = UIColor.whiteColor()
        merch3.text = "\n\nMugs"
        scrollView.addSubview(merch3)
        
        
        // Mark: Implement what the page looks like above here
        
        setScrollHeight() // Compacts the page
    }
    
    func addPhoto(sender: UIButton!) {
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
        ThePhotosManager.addPhoto(TheUsersManager.currentUser!, show: show!, source: photo)
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
