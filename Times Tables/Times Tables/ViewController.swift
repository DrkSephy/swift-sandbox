//
//  ViewController.swift
//  Times Tables
//
//  Created by David Leonard on 3/16/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func sliderMoved(sender: AnyObject) {
        // Create a new table whenever the slider updates
        table.reloadData();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell");
        let timesTable = Int(sliderValue.value * 20);
        cell.textLabel?.text = String(timesTable * indexPath.row);
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

