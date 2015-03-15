//
//  ViewController.swift
//  Primality
//
//  Created by David Leonard on 3/15/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var number: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        // Convert input to integer
        var numberInt = number.text.toInt();
        
        // Use statement to make sure numberInt is not nil
        if numberInt != nil {
            // Do primality check
            // Begin with assuming that a number is prime
            var isPrime = true;
            var unwrappedNumber = numberInt!;
            
            if unwrappedNumber == 1 {
                isPrime = false;
            }
            
            if unwrappedNumber != 2 && unwrappedNumber != 1 {
                for var i = 2; i < unwrappedNumber; i++ {
                    if unwrappedNumber % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                resultLabel.text = "\(unwrappedNumber) is prime.";
            } else {
                resultLabel.text = "\(unwrappedNumber) is not prime.";
            }
            
        } else {
            resultLabel.text = "Please enter a number!";
        }
        
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

