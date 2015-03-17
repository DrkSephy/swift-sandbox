//
//  ViewController.swift
//  Table Views
//
//  Created by David Leonard on 3/16/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
// UITableViewDelegate: Allows us to add content to the table view
class ViewController: UIViewController, UITableViewDelegate {
    
    // Array containing data for cells
    var cellContent = ["David", "Lisa", "DrkSephy"];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // This method allows us to return an integer which will correspond to the number of rows in the section of the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count;
        
    }
    
    // This method defines the contents of each individual cell.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell");
        cell.textLabel?.text = cellContent[indexPath.row];
        return cell;
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

