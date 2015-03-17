//
//  ViewController.swift
//  Stopwatch
//
//  Created by David Leonard on 3/16/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Create timer object
    var timer = NSTimer();
    
    // Create timer count variable
    var count = 0;
    // Create update time method
    func updateTime(){
        count++;
        time.text = "\(count)";
    }
    
    @IBOutlet weak var time: UILabel!
    
    @IBAction func pause(sender: AnyObject) {
    
    }
    
    
    @IBAction func stop(sender: AnyObject) {
    
    }
    
    /* Play button logic */
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

