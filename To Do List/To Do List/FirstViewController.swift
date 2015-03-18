//
//  FirstViewController.swift
//  To Do List
//
//  Created by David Leonard on 3/17/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

// Create a global variable accessible to both view controllers
var toDoList = [String]();

class FirstViewController: UIViewController, UITableViewDelegate {

    
    
    @IBOutlet weak var toDoListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Synchronize todo list items
        // Extra check, when the app is first run, this won't exist
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as [String];
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count;
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell");
        // Get the 0th, 1st, 2nd element, etc
        cell.textLabel?.text = toDoList[indexPath.row];
        
        return cell;
    }

    // Whenever the user swipes, we want to reload the table
   override func viewDidAppear(animated: Bool) {
    toDoListTable.reloadData();
    }
}

