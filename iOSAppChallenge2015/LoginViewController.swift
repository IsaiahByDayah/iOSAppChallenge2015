//
//  LoginViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/7/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playVTGame("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/q1xj1dF08vQ\" frameborder=\"0\" allowfullscreen></iframe>")
    }
    
    func playVTGame(link: String){
        var webViewBG = UIWebView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        webViewBG.loadHTMLString(link, baseURL: nil)
        webViewBG.userInteractionEnabled = true
        self.view.addSubview(webViewBG)
        
        
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
    }
    
    func animateTextField(textFielf: UITextField) {
        let moveDistance = 80
        let moveDuration = 0.3
        
        
    }
    
    @IBAction func login(sender: AnyObject) {
        
    }
    
    @IBAction func register(sender: AnyObject) {
        
    }
    
}
