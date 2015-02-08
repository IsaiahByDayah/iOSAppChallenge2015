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
            let tabbedViewController = MainTabViewController()
            presentViewController(tabbedViewController, animated: true, completion: nil)
        } else {
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
    @IBAction func register(sender: AnyObject) {
        performSegueWithIdentifier("loginComplete", sender: self)
    }
    
}
