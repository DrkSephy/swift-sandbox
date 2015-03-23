//
//  ViewController.swift
//  Webview Demo
//
//  Created by David Leonard on 3/23/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        var url = NSURL(string: "http://www.google.com");
        var request = NSURLRequest(URL:url!);

        webview.loadRequest(request);
        */
        
        // Loading HTML into a webview
        var html = "<html><head></head><body><h1>Hello World!</h1></body></html>";
        webview.loadHTMLString(html, baseURL: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

