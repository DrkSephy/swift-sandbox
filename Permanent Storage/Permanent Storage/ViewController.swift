//
//  ViewController.swift
//  Permanent Storage
//
//  Created by David Leonard on 3/17/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Store specific data relative to the user
        // This will create a key inside of user defaults with the value - David
        NSUserDefaults.standardUserDefaults().setObject("David", forKey: "name");
        
        // How do we get the data back?
        // We will make this value to be a string
        var name = NSUserDefaults.standardUserDefaults().objectForKey("name")! as String;
        
        println(name);
        
        /* Challenge : Store an array */
        var arr = [1, 2, 3];
        // Even if we comment this line out, the data will still be stored
        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "array");
        var recalledArray = NSUserDefaults.standardUserDefaults().objectForKey("array")! as NSArray;
        
        println(recalledArray[2]);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

