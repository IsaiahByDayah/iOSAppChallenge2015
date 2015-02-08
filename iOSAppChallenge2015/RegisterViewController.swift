//
//  RegisterViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageSet: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        imageSet = true
        dismissViewControllerAnimated(true, completion: nil)
    }
}
