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
//        showDescriptionTextArea.backgroundColor = show!.primaryColor
        showDescriptionTextArea.text = show?.description
        scrollView.addSubview(showDescriptionTextArea)
        
//        let episodesLabel = UILabel(frame: CGRect(x: scrollViewWidth * 0.05, y: showDescriptionTextArea.frame.maxY, width: scrollViewWidth * 0.9, height: 20.0))
//        episodesLabel.text = "Episodes"
//        scrollView.addSubview(episodesLabel)
        
        let challengesLabel = UILabel(frame: CGRect(x: scrollViewWidth * 0.05, y: showDescriptionTextArea.frame.maxY + 20.0, width: scrollViewWidth * 0.9, height: 20.0))
        challengesLabel.text = "Challenges"
        scrollView.addSubview(challengesLabel)
        
        let challenge1 = UITextView(frame: CGRect(x: scrollViewWidth * 0.1, y: challengesLabel.frame.maxY + 20.0, width: scrollViewWidth * 0.3, height: scrollViewWidth * 0.3))
        challenge1.backgroundColor = show!.primaryColor
        challenge1.textColor = UIColor.whiteColor()
        challenge1.textAlignment = NSTextAlignment.Center
        challenge1.font = UIFont.boldSystemFontOfSize(18.0)
        challenge1.text = "GUESS\nTHE\nCHARACTER?"
        scrollView.addSubview(challenge1)
        
        
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
