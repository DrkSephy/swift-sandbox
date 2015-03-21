//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by David Leonard on 3/20/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonPressed(sender: AnyObject) {
        var image = UIImage(named: "cross.png");
        // Display image for normal state
        // We use sender to indicate the UI element that was tapped
        sender.setImage(image, forState: .Normal);
        // print the sender that we tapped
        println(sender.tag);
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

