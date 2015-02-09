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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.restorationIdentifier == "usernameTextField" {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField.restorationIdentifier == "passwordTextField" {
            textField.resignFirstResponder()
            login(textField)
        }
        return false
    }
    
    @IBAction func login(sender: AnyObject) {
        if TheUsersManager.loginUser(usernameTextField.text, password: passwordTextField.text) {
            println("User logged in")
        performSegueWithIdentifier("loginComplete", sender: self)
        } else {
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
}
