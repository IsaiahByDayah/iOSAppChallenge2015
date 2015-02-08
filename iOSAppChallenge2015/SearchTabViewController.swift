//
//  SearchTabViewController.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/7/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var showSearchResults: [Show]!

    @IBOutlet weak var searchResultsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "pleasewritemeasong", size: 22)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.barTintColor = NavColor
        navigationController?.navigationBar.translucent = false
        
        showSearchResults = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TVShowCell", forIndexPath: indexPath) as UITableViewCell
        
        let show = showSearchResults[indexPath.row]
        
        cell.textLabel?.text = show.name
        cell.imageView?.image = show.thumbnail
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showSearchResults.count
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.restorationIdentifier == "searchTextField" {
            println("Hit Search")
            textField.resignFirstResponder()
            showSearchResults = TheShowsManager.searchShows(textField.text)
            searchResultsTableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        return false
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        showSearchResults = TheShowsManager.searchShows(textField.text)
        searchResultsTableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Automatic)
        return true
    }

}
