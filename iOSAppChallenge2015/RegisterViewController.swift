//
//  RegisterViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.image = UIImage(named: "Camera_icon.png")
        imageView.layer.cornerRadius = CGFloat(imageView.frame.size.width / 2.0)
        imageView.clipsToBounds = true
        
        let imageViewTappedGesture = UITapGestureRecognizer(target: self, action: "imageViewTapped:")
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(imageViewTappedGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        imageView.image = photo
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func backToLogInScreen(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.restorationIdentifier == "usernameTextField" {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField.restorationIdentifier == "passwordTextField" {
            textField.resignFirstResponder()
            registerUser(textField)
        }
        return false
    }
    
    @IBAction func registerUser(sender: AnyObject) {
        if usernameTextField.text == "" || passwordTextField.text == "" {
//            return
        }
        if TheUsersManager.addUser(usernameTextField.text, password: passwordTextField.text, profilePic: imageView.image) {
            println("User Registered")
            if TheUsersManager.loginUser(usernameTextField.text, password: passwordTextField.text) {
                println("User Logged In")
                performSegueWithIdentifier("registerComplete", sender: self)
            }
        } else {
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
    }
}
