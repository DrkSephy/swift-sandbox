//
//  feedTableViewController.swift
//  Instagram
//
//  Created by David Leonard on 3/25/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class feedTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 227; 
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // We are generating our own custom class with its own properties in order to update each cell at the cell level,
        // as opposed to the page level
        var myCell:cell = self.tableView.dequeueReusableCellWithIdentifier("myCell") as cell;
        myCell.title.text = "My title";
        myCell.username.text = "David";
        myCell.sizeToFit();
        
        return myCell;
        
    }
    
}
