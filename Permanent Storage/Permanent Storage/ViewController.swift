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
        var name = NSUserDefaults.standardUserDefaults().objectForKey("name")!;
        
        println(name);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

