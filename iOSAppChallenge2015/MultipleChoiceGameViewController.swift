//
//  GameViewController.swift
//  iOSAppChallenge2015
//
//  Created by Arthur Burgin on 2/8/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class MultipleChoiceGameViewController: UIViewController{
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        changeButtonsToAnswers()
        
    }
    
    func changeButtonsToAnswers(){
        choice1.setTitle("Bob", forState: UIControlState.Normal)
        choice2.setTitle("Brent", forState: UIControlState.Normal)
        choice3.setTitle("Sam", forState: UIControlState.Normal)
        choice4.setTitle("Danny", forState: UIControlState.Normal)
    }
    
    @IBAction func action1(sender: AnyObject) {
        if choice1.titleLabel?.text == "Bob"{
            choice1.setTitle("YOUGOT IT", forState: UIControlState.Normal)
        }
    }
    @IBAction func action2(sender: AnyObject) {
        if choice2.titleLabel?.text == "Bob"{
            choice2.setTitle("YOUGOT IT", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func action3(sender: AnyObject) {
        if choice3.titleLabel?.text == "Bob"{
            choice3.setTitle("YOUGOT IT", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func action4(sender: AnyObject) {
        if choice4.titleLabel?.text == "Bob"{
            choice4.setTitle("YOUGOT IT", forState: UIControlState.Normal)
        }
    }
        
    
    
    
}
