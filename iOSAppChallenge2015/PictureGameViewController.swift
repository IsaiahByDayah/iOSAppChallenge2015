//
//  GameViewController.swift
//  iOSAppChallenge2015
//
//  Created by Arthur Burgin on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class PictureGameViewController: UIViewController{
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var answer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func submit(sender: AnyObject) {
        if answer.text == "Bob"{
            label.text = "YOU ARE CORRECT"
        }
        else{
           label.text = "YOU ARE WRONG"
        }
    }
    
    
    
}
