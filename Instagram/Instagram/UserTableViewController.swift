//
//  UserTableViewController.swift
//  Instagram
//
//  Created by David Leonard on 3/24/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get the details of the user that is currently signed in
        
        println(PFUser.currentUser());
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell;
        cell.textLabel?.text = "David";
        return cell;
    }
}
