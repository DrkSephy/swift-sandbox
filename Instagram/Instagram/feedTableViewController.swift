//
//  feedTableViewController.swift
//  Instagram
//
//  Created by David Leonard on 3/25/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class feedTableViewController: UITableViewController {
    
    var titles = [String]();
    var usernames = [String]();
    var images = [UIImage]();
    var imageFiles = [PFFile]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className:"Post")
        // query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    // println(object["username"]);
                    self.titles.append(object["Title"] as String);
                    self.usernames.append(object["username"] as String);
                    self.imageFiles.append(object["imageFile"] as PFFile);
                    self.tableView.reloadData();
                }
                
            } else {
                // Log details of the failure
                println(error);
            }
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 227;
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // We are generating our own custom class with its own properties in order to update each cell at the cell level,
        // as opposed to the page level
        var myCell:cell = self.tableView.dequeueReusableCellWithIdentifier("myCell") as cell;
        myCell.title.text = titles[indexPath.row];
        myCell.username.text = usernames[indexPath.row];
        myCell.sizeToFit();
        
        return myCell;
        
    }
    
}
