//
//  ViewController.swift
//  Navigation
//
//  Created by David Leonard on 3/16/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer  = NSTimer();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Create a timer */
        /* target: the function calling this method 
           selector: the function we will call
            - selectors map to a function we want to call whenever the timer ticks
        */
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

