//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by David Leonard on 3/18/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Define url which we want to fetch data from
        let url = NSURL(string: "http://www.stackoverflow.com");
        // Define task for getting data from a URL
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            // data is returns through the following three parameters
            // NOTE: This is also known as a closure!
            (data, response, error) in
            // Check if there was an error with fetching the data
            if error == nil {
                println(data);
            }
            
        }
        // Run the task
        task.resume();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

