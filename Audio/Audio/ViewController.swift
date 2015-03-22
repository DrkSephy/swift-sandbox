//
//  ViewController.swift
//  Audio
//
//  Created by David Leonard on 3/21/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func play(sender: AnyObject) {
    }
    
    
    @IBAction func pause(sender: AnyObject) {
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
    }
    
    
    @IBOutlet weak var sliderValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

