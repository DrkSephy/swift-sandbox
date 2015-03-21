//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by David Leonard on 3/20/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = O, 2 = X
    var activePlayer = 1;
    
    // State of the board
    // 0 = empty
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 {
            var image = UIImage();
            gameState[sender.tag] = activePlayer;
            if activePlayer == 1 {
                image = UIImage(named: "nought.png")!;
                activePlayer = 2;
            } else {
                image = UIImage(named: "cross.png")!;
                activePlayer = 1;
            }
            // Display image for normal state
            // We use sender to indicate the UI element that was tapped
            sender.setImage(image, forState: .Normal);
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

