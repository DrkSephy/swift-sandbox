//
//  ViewController.swift
//  Cat Years
//
//  Created by David Leonard on 3/13/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var age: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func findAge(sender: AnyObject) {
        var enteredAge = age.text.toInt();
        var catYears = enteredAge! * 7;
        resultLabel.text = "Your cat is \(catYears)";
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

