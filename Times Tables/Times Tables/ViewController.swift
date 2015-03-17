//
//  ViewController.swift
//  Times Tables
//
//  Created by David Leonard on 3/16/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderValue: UISlider!
    @IBAction func sliderMoved(sender: AnyObject) {
        println(sliderValue);
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

