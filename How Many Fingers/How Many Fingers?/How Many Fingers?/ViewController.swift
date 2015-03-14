//
//  ViewController.swift
//  How Many Fingers?
//
//  Created by David Leonard on 3/14/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var guess: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func guessButton(sender: AnyObject) {
        // Generate random number between 1 and 5
        var randomNumber = arc4random_uniform(6);
        var guessInt = guess.text.toInt();
        if (guessInt != nil) {
            // We convert randomNumer from UINT32 to int
            if Int(randomNumber) == guessInt {
                resultLabel.text = "Correct!";
            } else {
                resultLabel.text = "Nope! It was \(randomNumber)";
            }
            
        } else {
            resultLabel.text = "Please enter a number 0-5";
        }
        
        
        println(guess.text);
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

