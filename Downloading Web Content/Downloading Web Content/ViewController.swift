//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by David Leonard on 3/18/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
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
                // Convert data to a readable String, not the original hex
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding);
                println(urlContent);
                // This will stop waiting for anything else to happen, and will perform the update straight away
                dispatch_async(dispatch_get_main_queue()){
                    
                
                    // Use self. to use anything in the closure
                    self.webView.loadHTMLString(urlContent!, baseURL: nil);
                }
            }
            
        }
        // Run the task
        // This is actually an asynchronous call
        task.resume();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

