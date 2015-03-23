//
//  ViewController.swift
//  JSON Demo
//
//  Created by David Leonard on 3/23/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL to get JSON from
        let urlPath = "http://www.telize.com/geoip";
        let url = NSURL(string: urlPath);
        
        let session = NSURLSession.sharedSession();
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if error != nil {
                println(error);
            } else {
                // println(data); // Initially, this will return machine code, not what we want!
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
                
                println(jsonResult["isp"]);
            }
        
        });
        task.resume();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

