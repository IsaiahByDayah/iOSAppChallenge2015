//
//  GameViewController.swift
//  iOSAppChallenge2015
//
//  Created by Arthur Burgin on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var answerTextField: UITextField!
    
    var newShow = Show(name: "HIMYM", description: "Cool Show", episodes: [], status: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        playVTGame(newShow, link:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/q1xj1dF08vQ?autoplay=1&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>")
    }
    
    @IBAction func submitButton(sender: AnyObject){
        var answer = "go"
        if answerTextField.text == answer{
            answerTextField.text = "You got it"
        }
    }
    
    func playVTGame(show: Show, link: String){
        var webViewBG = UIWebView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        webViewBG.loadHTMLString(link, baseURL: nil)
        webViewBG.userInteractionEnabled = true
        self.view.addSubview(webViewBG)
        
        
        
    }
    
}
