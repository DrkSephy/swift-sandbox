//
//  UserTableViewController.swift
//  Instagram
//
//  Created by David Leonard on 3/24/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    
    var users = [""];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get the details of the user that is currently signed in
        println(PFUser.currentUser());
        
        // Query all users in Parse database
        var query = PFUser.query();
        
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            self.users.removeAll(keepCapacity: true); // Get rid of all users in array
            for object in objects {
                // Grab all users from Parse database, store them inside users array
                var user:PFUser = object as PFUser;
                // Only display the other users, not the current user
                if user.username != PFUser.currentUser().username {
                    self.users.append(user.username);
                }
            }
            
            self.tableView.reloadData();
            
            
        });
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell;
        cell.textLabel?.text = users[indexPath.row];
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!;
        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
            cell.accessoryType = UITableViewCellAccessoryType.None;
            
            // Remove followers
            var query = PFQuery(className:"followers")
            query.whereKey("follower", equalTo: PFUser.currentUser().username);
            query.whereKey("following", equalTo: cell.textLabel?.text);
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    for object in objects {
                        object.deleteInBackground();
                    }
                    
                } else {
                    // Log details of the failure
                    println(error);
                }
            }
            
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
            // Create a connection for following users
            var following = PFObject(className: "followers"); // This is going to store our information about who is following who
            following["following"] = cell.textLabel?.text; // Grab user from table
            following["follower"] = PFUser.currentUser().username; // The follower is the current user logged in
            
            // Save to Parse backend
            following.saveInBackground();
        }
        
    }
}
