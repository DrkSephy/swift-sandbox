//
//  UserTableViewController.swift
//  Instagram
//
//  Created by David Leonard on 03/24/15
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var users = [""]
    var following = [Bool]()
    var refresher: UIRefreshControl!; // Pull to refresh
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(PFUser.currentUser())
        
        var query = PFUser.query()
        
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
        
            self.users.removeAll(keepCapacity: true)
            
            for object in objects {
                
                var user:PFUser = object as PFUser
                
                var isFollowing:Bool
                
                if user.username != PFUser.currentUser().username {
                
                    self.users.append(user.username)
                    
                    isFollowing = false
                    
                    var query = PFQuery(className:"followers")
                    query.whereKey("follower", equalTo:PFUser.currentUser().username)
                    query.whereKey("following", equalTo:user.username)
                    query.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            
                            for object in objects {
                                
                                isFollowing = true
                                
                            }
                            
                            self.following.append(isFollowing)
                            
                            self.tableView.reloadData()
                            
                        } else {
                            // Log details of the failure
                            println(error)
                        }
                    }
                    
                }
                
                
                
                
                
               

                
                
            }
            
            
        
        })
        
        // Pull to refresh code
        refresher = UIRefreshControl();
        // Add some attributes
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh");
        // Add a target
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged);
        self.tableView.addSubview(refresher);
        
    }
    
    func refresh() {
        println("refreshed");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(following)
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        if following.count > indexPath.row {
        
            if following[indexPath.row] == true {
            
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            }
            
        }
        
        cell.textLabel?.text = users[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
            
            cell.accessoryType = UITableViewCellAccessoryType.None
            
            var query = PFQuery(className:"followers")
            query.whereKey("follower", equalTo:PFUser.currentUser().username)
            query.whereKey("following", equalTo:cell.textLabel?.text)
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    
                    for object in objects {
                        
                        object.deleteInBackground()
                        
                    }
                } else {
                    // Log details of the failure
                    println(error)
                }
            }
            
        } else {
        
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            var following = PFObject(className: "followers")
            following["following"] = cell.textLabel?.text
            following["follower"] = PFUser.currentUser().username
            
            following.saveInBackground()
            
        }
        
    }
    
    

}
